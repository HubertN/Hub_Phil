class Users

  attr_accessor :name, :id
  @@id = 0
  def initialize(name)
    @name = name
    @@id += 1
    @id = @@id

  end



end
