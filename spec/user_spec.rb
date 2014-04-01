require 'spec_helper'


describe Users do

  it "should initialize with a name "do
    bob = Users.new("bob")
    bob.name = "bob"
  end

  it "should start user with an unique id" do
    bob = Users.new("bob")
    expect(bob.id).to eq 6
  end

  it "should start user with a password" do
    bob = Users.new("bob")
  end

end
