class AcceptInvite < UseCase
  def run(inputs)
    retrieved_invite = Rps.db.get_invite(inputs[:invite_id])

    user = Rps.db.get_user_by_session(inputs[:session_key])

    return failure(:invite_does_not_exist) if retrieved_invite == nil
    return failure(:invite_does_not_belong_to_you) if retrieved_invite.target != user.id
    retrieved_invite.pending = false
    match = Rps.db.create_match(retrieved_invite.inviter,retrieved_invite.target)
    round = Rps.db.create_round(:match_id => match.m_id)

    success(:match => match, :round=> round, :roundid => round.id, :matchid => match.m_id)
  end
end



