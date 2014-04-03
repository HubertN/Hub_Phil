require "spec_helper.rb"


describe Invite do

  it "should start with it's own unique id" do
    user1 = Users.new("bob","123")
    user2 = Users.new("sarah","abc")

    Invite.class_variable_set :@@id, 0
    expect(Invite.new(user1.id,user2.id).id).to eq(1)
    expect(Invite.new(user1.id,user2.id).id).to eq(2)
    expect(Invite.new(user1.id,user2.id).id).to eq(3)
  end




end
