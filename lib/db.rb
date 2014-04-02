require_relative "../spec/spec_helper.rb"
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
    end

    def sign_in_user(name,password)
      user = Users.new(name,password)
      @users[user.id] = user
    end

    def sign_up_user(name,password)
      listusernames = @users.values.map do |users|
        users.name
      end
      if listusernames.include?(name)
        return "username already exist"
      else
        sign_in_user(name,password)
      end
    end
  # our method, which gives us the singleton, if it already exists
  # will just return the the already made instance

    def create_match(userid,user2id)
      match = Match.new(userid,user2id)
      @matches[match.m_id] = match
    end
  end
end

 # listusernames = @users.values.name
 #      listusernames.each do |username|
 #        if username == name
 #          return "username already exist"
 #        else
 #          sign_in_user(name,password)
 #        end
 #      end
 #    end


   # listusernames = @users.values.map do |users|
   #      users.name
   #    end
   #    listusernames.each do |username|
   #      if username == name
   #        return "username already exist"
   #      else
   #        sign_in_user(name,password)
   #      end
   #    end
   #  end
