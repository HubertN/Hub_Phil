class Match
  attr_accessor :name, :m_id, :wm_id
  @@id = 0
  def initialize(name)
    @@id += 1
    @name = name
    @m_id = @@id
    @wm_id = nil
  end


end
