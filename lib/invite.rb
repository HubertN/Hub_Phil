class Invite
attr_reader :id, :inviter, :target
@@id = 0

  def initialize(inviter,target)
    @@id +=1
    @id = @@id
    @invite = inviter
    @target = target
  end

end
