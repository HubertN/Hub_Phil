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

end
