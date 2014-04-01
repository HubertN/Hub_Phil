require "spec_helper"

describe Match do

  it "should initialize with a match name" do
    match1 = Match.new("firstmatch")
    match1.name = "firstmatch"
  end

  it "should make a match with a unique id" do
    match1 = Match.new("firstmatch")
    expect(match1.m_id).to eq 2
  end

  it "should start a match, with two users" do
    match1 = Match.new("firstmatch")

  end

  it "a match should start with nil for match winner" do
    match1 = Match.new("firstmatch")
    expect(match1.wm_id).to eq nil
  end


end
