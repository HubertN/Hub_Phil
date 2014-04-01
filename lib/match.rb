class Match
  attr_accessor :name, :m_id
  @@id = 0
  def initialize(name)
    @@id += 1
    @name = name
    @m_id = @@id
  end


end
