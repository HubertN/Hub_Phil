class Invite
attr_reader :id
@@id = 0

  def initialize(data)
    @@id +=1
    @id = @@id
    @invite = data[:invite]
    @target = data[:target]
  end

end
