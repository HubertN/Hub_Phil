class Round
  attr_accessor :roundname, :r_id, :m_id, :wr_id
  @@id = 0
  def initialize(roundname,mid)
    @@id += 1
    @roundname = roundname
    @r_id = @@id
    @m_id = m_id
    @wr_id = nil
  end

  def play(user1,user2,userinput1,userinput2)

    if userinput1 == "rock"
      if userinput2 == "paper"
        return @wr_id = user2.id
      elsif userinput2 == "scissor"
        return @wr_id = user1.id
      end
    end


    # plays game
    # return either user1 or user2 winner
  end

end
