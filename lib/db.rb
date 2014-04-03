
module Rps
  # our singleton class
  def self.db
    @db_instance ||=DB.new
  end
  # so when you want to access the app's DB instance
  # you, use the db method
  # users = Rps.db.(whatevermethod(parameters))
  class DB
    attr_accessor :users, :rounds, :matches, :winners, :sessions, :invites
    def initialize
      @users = {}
      @rounds = {}
      @matches = {}
      @winners = {}
      @sessions = {}
      @invites = {}
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



    def update_match(mid,winner)
      thematch = @matches[mid]
      thematch.wm_id = winner
    end

    #ROUND CRUD
    def create_round(data)
      round = Round.new(data)
      @rounds[round.id] = round
    end

    def get_round(rid)
      @rounds[rid]
    end

    #SESSION CRUD
    def create_sessions(uid)
      session = Session.new(uid)
      @sessions[session.id] = session
    end

    def get_session(sid)
      @sessions[sid]
    end

    def create_invite(user1id,user2id)
      invite = Invite.new(user1id,user2id)
      @invites[invite.id] = invite
    end

    def get_invite(invite_id)
      @invites[invite_id]
    end

    def update_invite(invite_id)
      invite = get_invite(invite_id)
      invite.pending = false
      invite
    end

    def accept_invite(invite_id)
      invite = update_invite(invite_id)
      match = create_match(invite.inviter,invite.target)
      create_round({:match_id=>match.m_id})
    end
  end

end


