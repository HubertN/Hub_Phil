require 'spec_helper'


describe Users do

  it "should initialize with a name "do
    bob = Users.new("bob","123")
    bob.name = "bob"
  end

  it "should start user with an unique id" do
    bob = Users.new("bob","123")
    #expect(bob.id).to eq 8
  end

  it "should start user with a password" do
    bob = Users.new("bob","123")
    expect(bob.password).to eq "123"
  end

end
