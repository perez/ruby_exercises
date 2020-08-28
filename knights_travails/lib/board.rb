class Board
  attr_accessor :board, :knight

  def initialize(knight)
    @board = Array.new(8) { Array.new(8, nil) }
    @board[knight.root.point.first][knight.root.point.last] = knight.piece
  end
end
