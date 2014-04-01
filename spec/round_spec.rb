require "spec_helper"

describe Round do

  it "should initialize with a round name" do
    round1 = Round.new("rpsgame")
  end

  it "round should initialize with a unique round id" do
    round1 = Round.new("rpsgame")
    expect(round1.rd_id).to eq 2
  end
end
