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
  end
  # our method, which gives us the singleton, if it already exists
  # will just return the the already made instance

end
