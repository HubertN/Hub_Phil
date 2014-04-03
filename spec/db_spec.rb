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
  end
end
