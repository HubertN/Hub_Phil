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

  it "should get a user, based on their user id" do
    user1 =  @db.sign_up_user("bob","123")
    theuser = @db.get_user(user1.id)
    expect(theuser.accname).to eq "bob"
  end

  it "should get create a match" do #this test is okay
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    expect(@db.matches.length).to eq 0
    match = @db.create_match(user1.id,user2.id)
    expect(@db.matches.length).to eq 1

    expect(match.player1).to eq user1.id
    expect(match.player2).to eq user2.id

  end

  it "should get all matches" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")

    match = @db.create_match(user1.id,user2.id)

    expect(@db.matches.length).to eq 1

    expect(@db.get_all_matches.first.player1).to eq user1.id
  end

  it "should list all the users" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")
    expect(@db.get_all_users.first.id).to eq user1.id
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

  it "should get all rounds" do
    user1 =  @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("sarah","abc")
    match = @db.create_match(user1.id,user2.id)

    round = @db.create_round(:match_id=> match.m_id)

    expect(@db.rounds.length).to eq 1
    expect(@db.get_all_rounds.first.match_id).to eq match.m_id
    expect(@db.get_all_rounds.first.winner_id).to eq nil
  end

  it "should create a session" do
    expect(@db.sessions.length).to eq 0
    user1 = @db.sign_up_user("bob","123")
    #session = Sessions.new(user1.id)
    session = @db.create_session(user1.id)
    expect(@db.sessions.length).to eq 1
    retrieved_session = @db.get_session(session.id)
    expect(retrieved_session.id).to eq session.id
    expect(retrieved_session.userid).to eq user1.id
  end

  it "should get a session, based on session id" do
    user1 = @db.sign_up_user("bob","123")
    session = @db.create_session(user1.id)

    retrieved_session = @db.get_session(session.id)

    expect(retrieved_session.userid).to eq user1.id
  end

  it "should get all sessions" do
    user1 = @db.sign_up_user("bob","123")
    user2 = @db.sign_up_user("saraj","abc")

    session1 = @db.create_session(user1.id)
    session2 = @db.create_session(user2.id)

    sessionsarray = @db.get_all_sessions

    expect(sessionsarray.first.id).to eq session1.id
    expect(sessionsarray[1].userid).to eq user2.id
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
