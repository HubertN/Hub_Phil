# TO DO: change class name to sign in user

class SigninUser < UseCase
  def run(inputs)
    user = Rps.db.sign_in_user(inputs[:accname],inputs[:password])

    return failure(:user_does_not_exist) if user == nil

    success(:accname => user.name)
  end
end




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
