class Board
  TUTORIAL_BOARD = [
  '     |     |     ',
  '  1  |  2  |  3  ',
  '_____|_____|_____',
  '     |     |     ',
  '  4  |  5  |  6  ',
  '_____|_____|_____',
  '     |     |     ',
  '  7  |  8  |  9  ',
  '     |     |     '
  ].join("\n")

  attr_accessor :game_board

  def initialize
    @game_board = [
    '     |     |     ',
    '     |     |     ',
    '_____|_____|_____',
    '     |     |     ',
    '     |     |     ',
    '_____|_____|_____',
    '     |     |     ',
    '     |     |     ',
    '     |     |     '
    ].join("\n")
    
    display_tutorial

    puts @game_board
  end

  def display_tutorial
    puts "-----------------\n#{TUTORIAL_BOARD}\n-----------------"
  end

  def place_marker(input, marker)
    space = TUTORIAL_BOARD.index(input)

    @game_board[space] = marker
  end

  def horizontal?(marker)
    board_arr = @game_board.split("\n")

    board_arr.collect! do |row|
      row.count(marker) == 3
    end

    board_arr.any? 
  end

  def vertical?(marker)
    if @game_board[20] == marker && @game_board[74] == marker && @game_board[128] == marker
      true
    elsif @game_board[26] == marker && @game_board[80] == marker && @game_board[134] == marker
      true
    elsif @game_board[32] == marker && @game_board[86] == marker && @game_board[140] == marker
      true
    else
      false
    end
  end

  def diagonal?(marker)
    if @game_board[20] == marker && @game_board[80] == marker && @game_board[140] == marker
      true
    elsif @game_board[32] == marker && @game_board[80] == marker && @game_board[128] == marker
      true
    else
      false
    end
  end

  def update_game_board(input, marker)
    puts '-----------------'

    place_marker(input, marker)

    puts @game_board
  end
end
