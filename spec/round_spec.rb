require "spec_helper"

describe Round do

  it "should initialize with a round name" do
    round1 = Round.new(1)
  end

  it "round should initialize with a unique round id" do
    round1 = Round.new(1)
    expect(round1.r_id).to eq 3
  end

  it "starts a round with two players, and return id of user who won, rock paper" do
    round1 = Round.new(1)
    user1 = Users.new("bob","123")
    user2 = Users.new("john","abc")

    userinput1 = "rock"
    userinput2 = "paper"
    round1play = round1.play(user1,user2,userinput1,userinput2)

    expect(round1play).to eq (user2.id)
  end

  it "starts a round with two players, and return id of user who won, rock scissor" do
    round1 = Round.new(1)
    user1 = Users.new("bob","123")
    user2 = Users.new("john","abc")

    userinput1 = "rock"
    userinput2 = "scissor"
    round1play = round1.play(user1,user2,userinput1,userinput2)

    expect(round1play).to eq (user1.id)
  end

  it "starts a round with two players, and return id of user who won, rock rock" do
    round1 = Round.new(1)
    user1 = Users.new("bob","123")
    user2 = Users.new("john","abc")

    userinput1 = "rock"
    userinput2 = "rock"
    round1play = round1.play(user1,user2,userinput1,userinput2)

    expect(round1play).to eq (nil)
  end


  it "starts a round with two players, and return id of user who won, paper rock" do
    round1 = Round.new(1)
    user1 = Users.new("bob","123")
    user2 = Users.new("john","abc")

    userinput1 = "paper"
    userinput2 = "rock"
    round1play = round1.play(user1,user2,userinput1,userinput2)

    expect(round1play).to eq (user1.id)
  end

  it "starts a round with two players, and return id of user who won, paper scissor" do
    round1 = Round.new(1)
    user1 = Users.new("bob","123")
    user2 = Users.new("john","abc")

    userinput1 = "paper"
    userinput2 = "scissor"
    round1play = round1.play(user1,user2,userinput1,userinput2)

    expect(round1play).to eq (user2.id)
  end



  it "should start a round with nil for round winner id" do
    round1 = Round.new(1)
    expect(round1.wr_id).to eq nil
  end

end
