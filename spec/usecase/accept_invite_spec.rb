require_relative "../spec_helper.rb"

describe AcceptInvite do
  before do
    @user1 = Rps.db.sign_up_user("bob","123")
    @user2 = Rps.db.sign_up_user("sarah","abc")
    @user3 = Rps.db.sign_up_user("bob","yo")
    @session = Rps.db.create_session(@user1.id)
    @session2 = Rps.db.create_session(@user2.id)
    @session3 = Rps.db.create_session(@user3.id)
    @invite = Rps.db.create_invite(@user1.id,@user2.id)
    @invite2 = Rps.db.create_invite(@user2.id,@user3.id)
  end

  it "should take an invite id, and change pending to false,create a match,create a pending game " do

    expect(@invite.target).to eq @user2.id
    result = subject.run({:invite_id => @invite.id,:session_key => @session2.id, :target => @user2.id})
    expect(@invite.pending).to eq false
    expect(result.success?).to eq true
    expect(Rps.db.matches.length).to eq 1
    result.match
  end

  it "should give an error, if user tries to accept an invite that is not intended for them" do
    result = subject.run(:invite_id => @invite2.id, :session_key=> @session.id, :target => @user3.id)
    expect(result.error?).to eq true
    expect(result.error).to eq :invite_does_not_belong_to_you
  end

end


# @skey = 1

# user types "accept invite 1"
# return failure if that invite does not exist
# return failure if the user is not an invitee of that invite
# return failure if invite is not pending

# get_invites_for_user(id)

# matches

# parse throuh all rounds that belong to this match


