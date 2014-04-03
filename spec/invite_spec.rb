require "spec_helper.rb"


describe Invite do

  it "should start with it's own unique id" do
    user1 = Users.new("bob","123")
    user2 = Users.new("sarah","abc")
    invite1 = Invite.new(user1.id,user2.id)
    expect(invite1.id).to eq 3
  end



end
