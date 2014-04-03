
module Rps
  # our singleton class
  def self.db
    @db_instance ||=DB.new
  end
  # so when you want to access the app's DB instance
  # you, use the db method
  # users = Rps.db.(whatevermethod(parameters))
  class DB
    attr_accessor :users, :rounds, :matches, :winners
    def initialize
      @users = {}
      @rounds = {}
      @matches = {}
      @winners = {}
      @sessions = {}
    end



    #USER CRUD
    def sign_in_user(name,password)
      @users.each do |userid, user|
        if user.name == name && user.password == password
          return user
        end
      end
      return nil
    end

    def get_user(uid)
      @users[uid]
    end

    def get_user_by_name(name)
      @users.values.find { |user| user.name == name }
    end

    def sign_up_user(name,password)
      # @users.values.find

      # listusernames = @users.values.map do |users|
      #   users.name
      # end
      # if listusernames.include?(name)
      #   return nil
      # else
      user = Users.new(name,password)
      @users[user.id] = user
      # end
    end


    #MATCH CRUD
    def create_match(userid,user2id)
      match = Match.new(userid,user2id)
      @matches[match.m_id] = match
    end

    def get_match(mid)
      @matches[mid]
    end

    def create_round(mid)
      round = Round.new(mid)
      @rounds[round.r_id] = round
    end

    def update_match(mid,winner)
      thematch = @matches[mid]
      thematch.wm_id = winner
    end

    #ROUND CRUD


    #SESSION CRUD



  end

end


