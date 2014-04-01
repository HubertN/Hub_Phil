class Match
  attr_accessor :name, :m_id, :wm_id, :rwon
  @@id = 0
  def initialize(user1,user2)
    @user1 = user1.id
    @user2 = user2.id
    @@id += 1
    @m_id = @@id
    @wm_id = nil
    @rwon = {}
  end

  def startmatch(user1,user2)
    # checks if a user has won 3 rounds
    # if yes, then update @wm_id to equal userid who has won 3 rounds
    # a match should have two users, but have many games
  end


end
