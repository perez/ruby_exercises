class Node
  include Comparable

  attr_accessor :point, :moves

  def initialize(point)
    @point = point
    @moves = []
  end

  def <=>(other)
    self.point <=> other.point
  end
end
