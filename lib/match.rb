

class Match
  attr_accessor :name, :m_id, :wm_id, :rwon, :user1, :user2
  @@id = 0

  def initialize(user1_id,user2_id)
    @user1 = user1_id
    @user2 = user2_id
    @@id += 1
    @m_id = @@id
    @wm_id = nil
  end


  def startmatch(user1,user2)
    # checks if a user has won 3 rounds
    # if yes, then update @wm_id to equal userid who has won 3 rounds
    # a match should have two users, but have many games

  end


end

