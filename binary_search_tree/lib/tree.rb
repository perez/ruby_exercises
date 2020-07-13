class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr.uniq
    @root = Node.new(@arr.first)
  end
  
  def build_tree
    @arr.each do |data|
      next if data == arr.first

      insert(@root, Node.new(data))
    end
    
    @root
  end

  def insert(root_node, new_node)
    if root_node.nil?
      root_node = new_node
    else
      if new_node >= root_node
        root_node.right.nil? ? root_node.right = new_node : insert(root_node.right, new_node)
      else
        root_node.left.nil? ? root_node.left = new_node : insert(root_node.left, new_node)
      end
    end
  end

  def find(value)
    current_node = @root

    until value == current_node.data
      current_node = value >= current_node.data ? current_node.right : current_node.left

      break if current_node.nil?
    end

    current_node
  end
end
