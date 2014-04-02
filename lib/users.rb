class Users

  attr_accessor :name, :id, :password
  @@id = 0
  def initialize(name,password)
    @name = name
    @@id += 1
    @id = @@id
    @password = password
  end



end
