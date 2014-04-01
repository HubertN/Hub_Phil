require "spec_helper"

describe Round do

  it "should initialize with a round name" do
    round1 = Round.new("rpsgame",1)
  end

  it "round should initialize with a unique round id" do
    round1 = Round.new("rpsgame",1)
    expect(round1.r_id).to eq 2
  end

  xit "should start a round with two players" do
    round1 = Round.new("rpsgame",1)

    round1.play()
  end

  it "should start a round with nil for round winner id" do
    round1 = Round.new("rpsgame",1)
    expect(round1.wr_id).to eq nil
  end

end
