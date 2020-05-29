class TicTacToe
  attr_accessor :board, :current_player, :players, :spaces_used, :turn_count

  def initialize(board, players)
    @board = board
    @current_player = players.first
    @players = players
    @spaces_used = []
    @turn_count = 0
  end

  def player_input
    print @current_player.marker == 'X' ? "Player 1's turn.\n~> " : "Player 2's turn.\n~> "

    $stdin.gets.strip.downcase
  end

  def switch_player
    @current_player = @players.rotate!.first
  end

  def draw?
    @turn_count == 9
  end

  def player_one_won?
    @board.horizontal?('X') || @board.vertical?('X') || @board.diagonal?('X')
  end

  def player_two_won?
    @board.horizontal?('O') || @board.vertical?('O') || @board.diagonal?('O')
  end

  def game_over?
    draw? || player_one_won? || player_two_won?
  end

  def delcare_winner
    case true
    when player_one_won?
      puts 'Player 1 has won!'
    when player_two_won?
      puts 'Player 2 has won!'
    else
      puts 'Draw!'
    end
  end

  def play_game
    until game_over?
      input = player_input

      redo unless input.match?(/[1-9]/)
      
      redo if @spaces_used.include?(input) || input.length > 1

      @spaces_used << input

      @board.update_game_board(input, @current_player.marker)

      @turn_count += 1
      
      switch_player
    end

    delcare_winner
  end
end
