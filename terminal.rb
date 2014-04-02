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
      parseInput(userinput)
    end

  end

  def parseInput(userInput)
    parsedInput = userInput.split( " " )

    runCommand(parsedInput)
  end




  def runCommand(parsedInput)
    if parsedInput[0] == 'help'
      return
    elsif parsedInput[0] == 'login'
      puts "Account Name: ???"
      accname = gets.chomp.downcase
      puts "Password: ???"
      password = gets.chomp.downcase

      result = SigninUser.run({:accname=>accname,:password=>password})
      if result.success?
        puts result.accname
      else
        puts result.error
      end

    elsif parsedInput[0] == 'register'
      puts "Account Name: ???"
      accname = gets.chomp.downcase
      puts "Password: ???"
      password = gets.chomp.downcase

      result = SignupUser.run({:accname=>accname,:password=>password})
      if result.success?
        puts result.accname
      else
        puts result.error
      end

    end
  end
end


datterminal = TerminalClient.new
datterminal.main_menu
