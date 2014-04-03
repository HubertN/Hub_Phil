class Users

  attr_accessor :accname, :id, :password
  @@id = 0
  def initialize(accname,password)
    @accname = accname
    @@id += 1
    @id = @@id
    @password = password
  end



end
