class Node
  attr_accessor :node, :next_node

  def initialize(node = nil)
    @node = node
    @next_node = nil
  end
end
