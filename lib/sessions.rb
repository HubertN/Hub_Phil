class Session
@@id = 0
attr_reader :id, :userid
  def initialize(userid)
    @@id += 1
    @id = @@id
    @userid = userid
  end

end

def create_session(userid)

  session1 = Sesseion.new(userid)
  @sessions[session1.id] = session1
end

def get_session(sid)
  @sessions[sid]
end
