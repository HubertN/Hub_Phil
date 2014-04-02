class Users

  attr_accessor :name, :id, :password
  @@id = 0
  def initialize(name)
    @name = name
    @@id += 1
    @id = @@id
    @password = nil
  end



end
