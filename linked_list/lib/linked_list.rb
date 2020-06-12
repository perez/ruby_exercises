class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    @head.nil? ? @head = node : @tail.next_node = node

    @tail = node
  end

  def prepend(node)
    if @head.nil?
      @head = node
    
      @tail = node
    else
      node.next_node = @head

      @head = node
    end
  end

  def size
    size = 0

    current_node = @head

    until current_node.nil?
      size += 1

      current_node = current_node.next_node
    end

    size
  end

  # def head
  #   @head.nil? ? nil : @head.node
  # end

  # def tail
  #   @tail.nil? ? nil : @tail.node
  # end

  def at(index)
    current_node = @head

    1.upto(index) do
      current_node = current_node.next_node
      
      break if current_node.nil?
    end

    puts current_node.nil? ? nil : current_node.node
  end

  def pop
    current_node = @head

    until current_node.next_node == @tail
      current_node = current_node.next_node
    end

    current_node.next_node = nil

    @tail = current_node
  end

  def contain?(value)
    current_node = @head

    until current_node.next_node.nil?
      break if current_node.node == value

      current_node = current_node.next_node
    end
    
    puts current_node.node == value ? true : false 
  end

  def find(value)
    current_node = @head

    index = 0

    until current_node.nil?
      break if current_node.node == value

      current_node = current_node.next_node

      index += 1
    end

    puts current_node.nil? ? 'nil' : index
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

    1.upto(index) do
      current_node = current_node.next_node
      
      break if current_node.nil?
    end

    current_node.node = value unless current_node.nil?
  end
end
