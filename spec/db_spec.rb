require "spec_helper.rb"

describe "database" do

  before do
    @db = Rps.db
  end

  it "should sign in a user, give the user object" do
    expect(@db.users.length).to eq 0
    user1 = @db.sign_up_user("bob","123")
    expect(@db.users.length).to eq 1

    user2 = @db.sign_up_user("bob","124")
    expect(@db.sign_in_user("bob","123")).to eq (user1)
    # expect(@db.sign_in_user("sarah","abc")).to eq nil

  end

  it "should sign up a user, only if that username is not taken" do
    user1 = @db.sign_up_user("bob","123")
    expect(@db.users.length).to eq 1

    #expect(@db.sign_up_user("bob","1234")).to eq nil
  end

  it "should get a user, baseed on their user id" do
    user1 =  @db.sign_up_user("bob","123")
    theuser = @db.get_user(user1.id)
    expect(theuser.name).to eq "bob"
  end

  it "should get create a match" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    expect(@db.matches.length).to eq 0
    @db.create_match(user1.id,user2.id)
    expect(@db.matches.length).to eq 1

  end

  it "should get a match, based on mid" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    match = @db.create_match(user1.id,user2.id)
    thematch = @db.get_match(match.m_id)
    expect(match.m_id).to eq thematch.m_id
  end

  it "should update a match, to get the winner" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    match = @db.create_match(user1.id,user2.id)

    expect(match.wm_id).to eq nil

    @db.update_match(match.m_id,user1.id)

    expect(match.wm_id).to eq user1.id
  end





end
