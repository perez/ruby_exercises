class Tree
  attr_reader :root

  def initialize(arr = nil)
    @arr = arr.sort.uniq unless arr.nil?
    @root = build_tree(@arr, 0, @arr.length - 1) unless arr.nil?
  end

  def insert(node, root_node = @root)
    return if find(node.data)

    if root_node.nil?
      root_node = node
    else
      if node >= root_node
        root_node.right.nil? ? root_node.right = node : insert(node, root_node.right)
      else
        root_node.left.nil? ? root_node.left = node : insert(node, root_node.left)
      end
    end
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

  def find(value)
    root_node = @root

    until root_node.data == value
      root_node = root_node.data >= value ? root_node.left : root_node.right
      
      break if root_node.nil?
    end

    root_node unless root_node.nil?
  end

  def level_order
    return if @root.nil?
    
    level_order_array = Array.new(1, @root.data)

    level_order_array.each do |value|
      root_node = find(value)

      level_order_array << root_node.left.data unless root_node.left.nil?

      level_order_array << root_node.right.data unless root_node.right.nil?
    end
  end

  def depth_order(order)
    case order
    when :preorder
      preorder
    when :inorder
      inorder
    when :postorder
      postorder
    else
      "Please use ':preorder', ':inorder', or ':postorder' as the arguement."
    end
  end

  def depth(value = @root)
    root_node = Integer === value ? find(value) : value
  
    return -1 if root_node.nil?
  
    left = depth(root_node.left)
  
    right = depth(root_node.right)
  
    return [left, right].max + 1
  end

  def balanced?
    return nil if @root.nil?
    
    tree_array = depth_order(:inorder)
  
    tree_array_root = tree_array.index(@root.data) 
    
    left_subtree = tree_array[0..(tree_array_root - 1)].length
  
    right_subtree = tree_array[(tree_array_root + 1)..-1].length
  
    if left_subtree == right_subtree
      true
    elsif (left_subtree - right_subtree == 1) || (right_subtree - left_subtree == 1)
      true 
    else
      false
    end
  end

  def rebalance
    return if balanced?

    new_array = level_order.sort
  
    @root = build_tree(new_array, 0, new_array.length - 1) unless new_array.nil?
  end

  private

  def build_tree(arr, arr_start, arr_end)
    return if arr_start > arr_end

    arr_middle = (arr_start + arr_end) / 2

    tree = Node.new(arr[arr_middle])

    tree.left = build_tree(arr, arr_start, arr_middle - 1)

    tree.right = build_tree(arr, arr_middle + 1, arr_end)

    tree
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

  def find_smallest_node(node)
    node = node.left until node.left.nil?
    
    node
  end
  
  def preorder(root_node = @root, depth_array = [])
    return if root_node.nil?

    depth_array << root_node.data
      
    preorder(root_node.left, depth_array)
      
    preorder(root_node.right, depth_array)
    
    depth_array
  end
  
  def inorder(root_node = @root, depth_array = [])
    return if root_node.nil?
    
    inorder(root_node.left, depth_array)
      
    depth_array << root_node.data
      
    inorder(root_node.right, depth_array)

    depth_array
  end
  
  def postorder(root_node = @root, depth_array = [])
    return if root_node.nil?

    postorder(root_node.left, depth_array)
      
    postorder(root_node.right, depth_array)
      
    depth_array << root_node.data

    depth_array
  end
end
