class Session
@@id = 0
attr_reader :id, :userid
  def initialize(userid)
    @@id += 1
    @id = @@id
    @userid = userid
  end

end

