class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)

    @head.nil? ? @head = node : @tail.next_node = node

    @tail = node
  end

  def prepend(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
    
      @tail = node
    else
      node.next_node = @head

      @head = node
    end
  end

  def size
    current_node = @head
    
    size = 0

    until current_node.nil?
      current_node = current_node.next_node
      
      size += 1
    end

    size
  end

  def head
    @head.nil? ? nil : @head.node
  end

  def tail
    @tail.nil? ? nil : @tail.node
  end

  def at(index)
    return nil if index >= self.size
    
    current_node = @head

    index.times do
      current_node = current_node.next_node
      
      break if current_node.nil?
    end

    current_node.node
  end

  def pop
    return nil if @head.nil?

    current_node = @head

    popped = @tail.node

    current_node = current_node.next_node until current_node.next_node == @tail

    current_node.next_node = nil

    @tail = current_node

    popped
  end

  def contain?(value)
    current_node = @head

    until current_node.next_node.nil?      
      current_node.node == value ? break : current_node = current_node.next_node
    end
    
    current_node.node == value
  end

  def find(value)
    current_node = @head

    index = 0

    until current_node.nil?
      current_node.node == value ? break : current_node = current_node.next_node

      index += 1
    end

    current_node.nil? ? nil : index
  end

  def to_s
    list = ''

    current_node = @head

    until current_node.nil?
      list << "[ #{current_node.node} ] -> "
      
      current_node = current_node.next_node
    end

    list + '[ nil ]'
  end

  def insert_at(value, index)
    current_node = @head

    previous_node = nil

    if index.zero?
      self.prepend(value)
    elsif index >= self.size
      nil
    else
      index.times do
        previous_node = current_node
  
        current_node = current_node.next_node
      end
  
      previous_node.next_node = Node.new(value, current_node)
    end
  end

  def remove_at(index)
    removed = self.at(index)
    
    current_node = @head

    previous_node = nil

    if index.zero?
      @head = @head.next_node
    elsif index >= self.size
      nil
    else
      index.times do
        previous_node = current_node
  
        current_node = current_node.next_node
      end
  
      previous_node.next_node = current_node.next_node
    end

    removed
  end
end
