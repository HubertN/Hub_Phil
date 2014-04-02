require "spec_helper.rb"

describe "database" do

  before do
    @db = Rps.db
  end

  it "should start with 0 users" do
    expect(@db.users.length).to eq 0
  end

  it "should start with 0 rounds" do
    expect(@db.rounds.length).to eq 0
  end

  it "should sign in a user, with a password " do
    user = @db.sign_in_user("bob","123")
    expect(user.id).to eq 1
    expect(@db.users.length).to eq 1

  end

  it "should sign up a user, if username does not exist" do
    user = @db.sign_in_user("bob","123")
    user2 = @db.sign_up_user("sarah","234")

    expect(@db.users.length).to eq 2

    expect(@db.sign_up_user("sarah","abc")).to eq "username already exist"
    expect(@db.users.length).to eq 2
  end

  it "should create a match with two users to play" do
    user1 = @db.sign_in_user("bob","123")
    user2 = @db.sign_up_user("sarah","234")

    expect(@db.matches.length).to eq 0
    match1 = @db.create_match(user1.id,user2.id)
    expect(@db.matches.length).to eq 1
  end

  it "should create a round that belongs to a match" do
    user1 = @db.sign_in_user("bob","123")
    user2 = @db.sign_up_user("sarah","234")

    expect(@db.rounds.length).to eq 0
    match1 = Match.new(user1.id, user2.id)
    expect(match1.m_id).to eq 2

    round1 = @db.create_round("roundone",match1.m_id)
    expect(round1.r_id).to eq 1

    expect(@db.rounds.length).to eq 1
  end

  it "should play a round and return the userid who won, and matchid, rock paper" do

    user1 = Users.new("bob","123")
    user2 = Users.new("john","abc")

    userinput1 = "rock"
    userinput2 = "paper"
    round1play = round1.play(user1,user2,userinput1,userinput2)

    expect(round1play).to eq (user2.id)
  end
end
