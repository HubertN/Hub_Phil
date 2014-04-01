require "spec_helper"

describe Match do

  it "should initialize with a match name" do
    match1 = Match.new("firstmatch")
    match1.name = "firstmatch"
  end

  it "should make a match with a unique id" do
    match1 = Match.new("firstmatch")
    expect(match1.mt_id).to eq 2
  end
end
