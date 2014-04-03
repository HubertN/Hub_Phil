# TO DO: change class name to sign in user

class SignupUser < UseCase
  def run(inputs)
    accname = inputs[:accname]
    password = inputs[:password]



    return failure(:name_taken) if Rps.db.get_user_by_name(accname) !=nil

    user = Rps.db.sign_up_user(inputs[:accname],inputs[:password])
    success(:user=> user)
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
