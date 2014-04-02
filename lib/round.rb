

 class Round
    attr_reader :id
    attr_accessor :match_id, :winner_id, :loser_id, :p1_choice, :p2_choice, :user, :user2
    @@counter = 0

    def initialize(attrs)
      @@counter += 1
      @id = @@counter
      @match_id = attrs[:match_id]
      @winner_id = attrs[:winner_id]
      @loser_id = attrs[:loser_id]
      @p1_choice = attrs[:p1_choice]
      @p2_choice = attrs[:p2_choice]
      @user1 = attrs[:user]
      @user2 = attrs[:user2]
    end




# DON'T EVER ASSIGN AND RETURN AT THE SAME TIME
  def play(p1_choice,p2_choice)
    if p1_choice == "rock"
      if p2_choice == "paper"
        self.winner_id = p2_choice.id
      elsif p2_choice == "scissor"
        self.winner_id = p1_choice.id
      end

      return winner_id
    end

    if p1_choice == "paper"
      if p2_choice == "rock"
        return @winner_id = p1_choice.id
      elsif p2_choice == "scissor"
        return @winner_id = p2_choice.id
      else
        return @winner_id
      end
    end

    if p1_choice == "scissor"
      if p2_choice == "rock"
        return @winner_id = p2_choice.id
      elsif p2_choice == "paper"
        return @winner_id = p1_choice.id
      else
        return @winner_id
      end
    end


    # plays game
    # return either p1_choice or p2_choice winner
  end

end
