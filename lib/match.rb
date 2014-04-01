class Match
  attr_accessor :name, :mt_id
  @@id = 0
  def initialize(name)
    @@id += 1
    @name = name
    @mt_id = @@id
  end
end
