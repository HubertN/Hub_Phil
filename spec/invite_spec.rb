require "spec_helper.rb"


describe Invite do

  it "should start with it's own unique id" do
    invite1 = Invite.new
    expect(invite1.id).to eq 1
  end

  it "should invite a user to play a game" do
    invite1 = Invite.new

  end

end
