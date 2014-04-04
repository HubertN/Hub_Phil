class SendInvite < UseCase
  def run(inputs)
    #user = Rps.db.get_user_by_name(inputs[:accname])
    user = Rps.db.get_user_by_session(inputs[:session_key])

    target = Rps.db.get_user(inputs[:target])

    return failure(:user_does_not_exist) if target == nil

    invite = Rps.db.create_invite(user.id,inputs[:target])
    success(:invitepending => invite.pending, :inviter=>user.id, :target => target.id)
  end
end


