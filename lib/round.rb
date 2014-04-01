class Round
  attr_accessor :roundname, :r_id, :m_id
  @@id = 0
  def initialize(roundname,mid)
    @@id += 1
    @roundname = roundname
    @r_id = @@id
    @m_id = m_id
  end


end
