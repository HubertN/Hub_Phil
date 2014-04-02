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
end
