require_relative "../spec_helper.rb"

describe SendInvite do

  it "sends an invite to another player, based on id" do
    user1 = Rps.db.sign_up_user("bob","123")
    user2 = Rps.db.sign_up_user("sarah","abc")


    session = Rps.db.create_session(user1.id)



    result = subject.run({:session_key => session.id, :target =>user2.id})
    expect(result.invitepending).to eq true
    expect(result.inviter).to eq user1.id
    expect(result.target).to eq user2.id
  end

  it "should give an error message and an invite is sent to a player that does not exist" do
    user1 = Rps.db.sign_up_user("bob","123")

    session = Rps.db.create_session(user1.id)


    result = subject.run({:session_key => session.id, :target =>99999999})
    expect(result.error?).to eq true
    expect(result.error).to eq :user_does_not_exist

  end

end

# user sends an invite

# puts "enter id of player you want to invite"
# other_player_id = gets.chomp
# result = SendInvite.run(session_key: @session_key, invitee: other_player_id)
