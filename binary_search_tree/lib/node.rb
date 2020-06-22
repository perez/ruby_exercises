class Node
  include Comparable

  attr_accessor :data, :left_node, :right_node

  def initialize(data)
    @data = data
    @left_node = nil
    @right_node = nil
  end

  def <=>(other)
    self.data <=> other.data
  end
end
