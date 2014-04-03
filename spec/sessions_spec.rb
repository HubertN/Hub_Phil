require_relative "spec_helper.rb"

describe Session do

  it "should start a session with unique id, and user id" do
    sesson1 = Session.new(2)
    expect(sesson1.id).to eq 3
  end
end
