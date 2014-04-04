class AcceptInvite < UseCase
  def run(inputs)
    invite = Rps.db.get_invite(inputs[:invite_id])

    return failure(:invite_does_not_exist) if invite == nil

    invite.pending = false

  end
end



