class Round
  attr_accessor :roundname, :rd_id
  @@id = 0
  def initialize(roundname)
    @@id += 1
    @roundname = roundname
    @rd_id = @@id
  end

end
