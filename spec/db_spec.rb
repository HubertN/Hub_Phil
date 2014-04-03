require "spec_helper.rb"

describe "database" do

  before do
    @db = Rps.db
  end



  it "should sign up a user, only if that username is not taken" do
    user1 = @db.sign_up_user("bob","123")
    expect(@db.users.length).to eq 1

    #expect(@db.sign_up_user("bob","1234")).to eq nil
  end

  it "should get a user, baseed on their user id" do
    user1 =  @db.sign_up_user("bob","123")
    theuser = @db.get_user(user1.id)
    expect(theuser.accname).to eq "bob"
  end

  it "should get create a match" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    expect(@db.matches.length).to eq 0
    @db.create_match(user1.id,user2.id)
    expect(@db.matches.length).to eq 1

  end

  it "should list all the users" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")
    expect(@db.get_all_users).to eq ([user1,user2])
  end

  it "should get a match, based on mid" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    match = @db.create_match(user1.id,user2.id)
    thematch = @db.get_match(match.m_id)
    expect(match.m_id).to eq thematch.m_id
  end

  it "should update a match, to get the winner" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    match = @db.create_match(user1.id,user2.id)

    expect(match.wm_id).to eq nil

    @db.update_match(match.m_id,user1.id)

    expect(match.wm_id).to eq user1.id
  end

  it "should create a round" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")
    match = @db.create_match(user1.id,user2.id)

    expect(@db.rounds.length).to eq 0
    round = @db.create_round({:match_id => match.m_id,:winner_id => user2.id, :u1_choice=> "scissors"})
    expect(@db.rounds.length).to eq 1
    expect(round.id).to eq 1
  end

  it "should get a round, based on the round's id" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")
    match = @db.create_match(user1.id,user2.id)
    round = @db.create_round({:match_id => match.m_id,:winner_id => user2.id, :u1_choice=> "scissors"})

    theround = @db.get_round(round.id)
    expect(theround.winner_id).to eq user2.id
  end

  it "should create a session" do
    expect(@db.sessions.length).to eq 0
    user1 = @db.sign_up_user("bob","123")
    #session = Sessions.new(user1.id)
    @db.create_session(user1.id)
    expect(@db.sessions.length).to eq 1

  end

  it "should get a session, based on session id" do
    user1 = @db.sign_up_user("bob","123")
    session = @db.create_session(user1.id)

    expect(@db.get_session(session.id)).to eq session
  end

  it "should create an invite" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    expect(@db.invites.length).to eq 0
    invite = @db.create_invite(user1.id,user2.id)
    expect(@db.invites.length).to eq 1
    expect(invite.pending).to eq true
  end

  it "should get an invite" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    invite = @db.create_invite(user1.id,user2.id)

    theinvite = @db.get_invite(invite.id)

    expect(theinvite.id).to eq invite.id
  end

  it "should update an invite, to no longer be pending" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    invite = @db.create_invite(user1.id,user2.id)

    expect(invite.pending).to eq true

    @db.update_invite(invite.id)
    expect(invite.pending).to eq false
  end

  it "should get the user object, from the session key" do
    user1 =  @db.sign_up_user("bob","123")
    session = @db.create_session(user1.id)
    userobject = @db.get_user_by_session(session.id)
    expect(userobject.accname).to eq "bob"
  end




end
