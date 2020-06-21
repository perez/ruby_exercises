class Node
  attr_accessor :root, :left_node, :right_node

  def initialize(root)
    @root = root
    @left_node = nil
    @right_node = nil
  end
end
