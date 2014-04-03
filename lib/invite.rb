class Invite
attr_reader :id, :inviter, :target
attr_accessor :pending
@@id = 0

  def initialize(inviter,target)
    @@id +=1
    @id = @@id
    @inviter = inviter
    @target = target
    @pending = true
  end

end
