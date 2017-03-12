class Run
  attr_reader :duration, :distance, :timestamp
  @@runs = []
  def initialize (arg)
    @duration = arg[:duration]
    @distance = arg[:distance]
    @timestamp = arg[:timestamp]
    @@runs << self
  end
  def self.log(args)
    Run.new(args)
  end
  def self.count(args=nil)
    n = 0
    @@runs.each do
      n += 1
    end
    return n
  end
end
