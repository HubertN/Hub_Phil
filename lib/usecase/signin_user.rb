# TO DO: change class name to sign in user

class SigninUser < UseCase
  def run(inputs)
    # user = Rps.db.sign_in_user(inputs[:accname],inputs[:password])
    user = Rps.db.get_user_by_name(inputs[:accname])

    return failure(:user_does_not_exist) if user == nil
    return failure(:password_invalid) if user.password != inputs[:password]
    session = Rps.db.create_session(user.id)
    success(:session => session, :session_key => session.id, :user => user)
  end


end

# class Client

# def start

# user signs in
# result = SigninUser.run({ name: "Bob", password: "123"})

# @session_key = result.session_key

# user sends an invite

# puts "enter id of player you want to invite"
# other_player_id = gets.chomp
# result = SendInvite.run(session_key: @session_key, invitee: other_player_id)


# end
# end

# x = Client.new.start



