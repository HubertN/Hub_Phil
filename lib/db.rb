
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


    def get_user(uid)
      @users[uid]
    end

    def get_user_by_name(accname)
      @users.values.find { |user| user.accname == accname }
    end

    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    #         USER CRUD
    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    def sign_up_user(accname,password)

      user = Users.new(accname,password)
      @users[user.id] = user
      # end
    end

    def sign_in_user(accname, password)

    end

    def get_all_users
      @users.values
    end

    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    #MATCH CRUD
    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

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

    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    #ROUND CRUD
    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    def create_round(data)
      round = Round.new(data)
      @rounds[round.id] = round
    end

    def get_round(rid)
      @rounds[rid]
    end

    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    #SESSION CRUD
    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    def create_sessions(uid)
      session = Session.new(uid)
      @sessions[session.id] = session
      session
    end

    def get_session(sid)
      @sessions[sid]
    end

    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    #INVITE CRUD
    #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

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

    def start_round(mid, session_key, current_user1_choice)
      match = get_match(mid)

      user = @users[sessions[session_key].userid]

      create_round({:match_id => mid, :u1_choice=>current_user1_choice})
    end

    def end_round(mid,rid,session_key, current_user2_choice )
      match = get_match(mid)

    end

  end

end


