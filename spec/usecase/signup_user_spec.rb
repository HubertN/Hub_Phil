require_relative "../spec_helper.rb"

describe SigninUser do
  before do
    @db = Rps.db
  end

  it "signs up a user, with a name and password" do
    user1 = @db.sign_up_user("bob","123")

    #@db.sign_in_user("bob","123")

    result = subject.run({:accname => "bob", :password =>"123"})
    expect(result.success?).to eq true
    expect(result.user.accname).to eq "bob"


  end

  it "errors if the user does not exists" do
    result = subject.run({:accname => "MJ", :password =>"Bulls"})
    expect(result.error?).to eq true
    expect(result.error).to eq :user_does_not_exist
  end

end

