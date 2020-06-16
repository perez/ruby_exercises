class Node
  attr_accessor :node, :next_node

  def initialize(node = nil, next_node = nil)
    @node = node
    @next_node = next_node
  end
end
