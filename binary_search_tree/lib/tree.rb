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
    root_node = @root

    until root_node.data == value
      root_node = root_node.data >= value ? root_node.left : root_node.right
      
      break if root_node.nil?
    end

    root_node
  end

  def find_smallest_node(node)
    node = node.left until node.left.nil?

    node
  end

  def delete(value)
    node_to_delete = find(value)

    if node_to_delete.nil?
      return nil
    elsif node_to_delete.left.nil? && node_to_delete.right.nil?
      delete_leaf(@root, node_to_delete)
    elsif node_to_delete.left && node_to_delete.right
      delete_node_with_children(node_to_delete)
    else
      delete_node_with_child(@root, node_to_delete)
    end

    value
  end

  def delete_leaf(root_node, node)
    if node >= root_node
      root_node.right == node ? root_node.right = nil : delete_leaf(root_node.right, node)
    else
      root_node.left == node ? root_node.left = nil : delete_leaf(root_node.left, node)
    end
  end
  
  def delete_node_with_children(node)
    temp = find_smallest_node(node.right)

    delete(temp.data)

    node.data = temp.data
  end
  
  def delete_node_with_child(root_node, node)
    if node >= root_node
      if node == root_node.right
        root_node.right = node.right.nil? ? node.left : node.right
      else
        delete_node_with_child(root_node.right, node)
      end
    else
      if node == root_node.left
        root_node.left = node.right.nil? ? node.left : node.right
      else
        delete_node_with_child(root_node.left, node)
      end
    end
  end

end
