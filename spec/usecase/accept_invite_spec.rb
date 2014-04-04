require_relative "../spec_helper.rb"

describe AcceptInvite do
  before do
    @user1 = Rps.db.sign_up_user("bob","123")
    @user2 = Rps.db.sign_up_user("sarah","abc")
    @invite = Rps.db.create_invite(@user1.id,@user2.id)
  end

  it "should take an invite id, and change pending to false" do
    result = subject.run(:invite_id => @invite.id)
    expect(@invite.pending).to eq false

  end

end
