require_relative "lib/rps.rb"


class TerminalClient
  @exit = false


  def main_menu

    while !@exit do
      puts "    Welcome to the Rock Paper Scissors"
      puts "    Available Commands:"
      puts "      Login : Sign in to existing user."
      puts "      Register : Create a user account."
      puts "      "
      userinput = gets.chomp.downcase
      puts "Command Accepted '#{userinput}'"
      runMainCommand(parseInput(userinput))
    end

  end

  def user_menu(sessionkey,user)
    puts "Welcome, #{user.accname}"
    puts "Available Commands:"
    puts "  List : Lists all users"
    puts "  Invite : Invite someone to play a match."
    puts "  Pending : Show all pending invites, and match moves"
    puts "  Accept : Accept a pending invite"
    puts "Also, You have #{update_function(sessionkey)}"


    userinput = gets.chomp.downcase
    puts "Command Accepted '#{userinput}'"
    runUserCommand(parseInput(userinput), sessionkey)

  end

  def update_function(sessionkey)
    " --------- '0' pending moves and '0' match invites."
  end

  def parseInput(userInput)
    parsedInput = userInput.split( " " )
  end


  def runMainCommand(parsedInput)
    if parsedInput[0] == 'help'
      return
    elsif parsedInput[0] == 'login'
      puts "Account Name: ???"
      accname = gets.chomp.downcase
      puts "Password: ???"

      password = gets.chomp.downcase

      result = SigninUser.run({:accname=>accname,:password=>password})
      if result.success?

        puts "User successfully signed in with accname: #{result.user.accname}"
        puts "Users session_id is #{result.session_key}"
        user_menu(result.session_key,result.user)
      else
        puts "User couldn't sign in, error: #{result.error}"
      end

    elsif parsedInput[0] == 'register'
      puts "Account Name: ???"
      accname = gets.chomp.downcase
      puts "Password: ???"
      password = gets.chomp.downcase

      result = SignupUser.run({:accname=>accname,:password=>password})
      if result.success?
        puts "User successfully REGISTERED  #{result.user.accname}"
      else

        puts "User couldn't REGISTER, error: #{result.error}"
      end

    end
    main_menu
  end

  def runUserCommand(parsedInput, sessionkey)
    if parsedInput[0] == "list"
      userarray = Rps.db.get_all_users
      puts "ID NAME"
      userarray.each do |user|
      puts "#{user.id}   #{user.accname}"
      end
    elsif parsedInput[0] == "invite"
      puts "Who would you like to invite?"
      target = gets.chomp.downcase.to_i
      result =SendInvite.run({:target => target, :session_key => sessionkey})
      if result.success?
        puts "You sent an invite to #{result.target}"
      else
        puts "You didn't send an invite, error: #{result.error}"
      end

    end
    user_menu(sessionkey, Rps.db.get_user_by_session(sessionkey))
  end
end


datterminal = TerminalClient.new
datterminal.main_menu
