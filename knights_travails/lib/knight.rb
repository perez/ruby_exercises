class Knight
  attr_accessor :piece, :end_point, :root

  def initialize(start_point, end_point)
    @piece = '♞'
    @end_point = Node.new(end_point)
    @root = Node.new(start_point)
    @root == @end_point ? return : possible_paths(@root)
  end

  private

  def possible_moves(node)
    x = node.point.last

    y = node.point.first

    node.moves << Node.new([y - 1, x - 2]) unless (y - 1 < 0) || (x - 2 < 0)

    node.moves << Node.new([y - 2, x - 1]) unless (y - 2 < 0) || (x - 1 < 0)

    node.moves << Node.new([y - 2, x + 1]) unless (y - 2 < 0) || (x + 1 > 7)

    node.moves << Node.new([y - 1, x + 2]) unless (y - 1 < 0) || (x + 2 > 7)

    node.moves << Node.new([y + 1, x + 2]) unless (y + 1 > 7) || (x + 2 > 7)

    node.moves << Node.new([y + 2, x + 1]) unless (y + 2 > 7) || (x + 1 > 7)

    node.moves << Node.new([y + 2, x - 1]) unless (y + 2 > 7) || (x - 1 < 0)

    node.moves << Node.new([y + 1, x - 2]) unless (y + 1 > 7) || (x - 2 < 0)
  end

  def possible_paths(node)
    possible_moves(node)

    return if node.moves.include?(@end_point)

    current_nodes = node.moves

    loop do
      next_nodes = []

      current_nodes.map do |child|
        possible_moves(child)

        return if child.moves.include?(@end_point)
      end

      current_nodes.each do |child|
        child.moves.each { |move| next_nodes << move }
      end

      current_nodes = next_nodes
    end
  end
end
