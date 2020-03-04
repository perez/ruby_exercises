require './lib/board'
require './lib/tic_tac_toe'
require './lib/player'

print "-----------\nTIC-TAC-TOE\n-----------\nPlay | Exit\n-----------\n~> "

loop do
  input = $stdin.gets.strip.downcase

  case input
  when 'play'
    break
  when 'exit'
    return
  else
    print "Please enter either 'Play' or 'Exit'\n~> "
  end
end

board = Board.new
player_one = Player.new('X')
player_two = Player.new('O')
tic_tac_toe = TicTacToe.new(board, player_one, player_two)

tic_tac_toe.play_game
