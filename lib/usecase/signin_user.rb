# TO DO: change class name to sign in user

class SigninUser < UseCase
  def run(inputs)
    # user = Rps.db.sign_in_user(inputs[:accname],inputs[:password])
    user = Rps.db.get_user_by_name(inputs[:accname])

    return failure(:user_does_not_exist) if user == nil
    return failure(:password_invalid) if user.password != inputs[:password]
    session = Rps.db.create_sessions(user.id)
    success(:session => session, :session_key => session.id, :user => user)
  end


end

# result = SigninUser.run({ some stuff })

# @session_key = result.session_key

# send_invite(@session_key, other_player_id)



# module TM

#   class ProjectShow < UseCase
#     def run(inputs)
#       # inputs = { :pid => "user inputted pid"}
#       project = TM.db.get_project(inputs[:pid])

#       return failure(:project_does_not_exist) if project == nil

#       remaining_tasks = TM.db.remaining_task_proj(inputs[:pid])
#       success(:project => project, :remaining_tasks => remaining_tasks)
#     end

#   end

# end
