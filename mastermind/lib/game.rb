class Game
  def initialize(codemaker, codebreaker)
    @codemaker = codemaker
    @codebreaker = codebreaker
    @guesses_left = 12
    @codebreaker_guess = nil
    @codemaker_feedback = nil
  end

  def play
    until game_over?
      codebreaker_turn

      @guesses_left -= 1

      codemaker_turn
    end

    result_of_game
  end

  private

  def game_over?
    @codemaker_feedback == %w[B B B B] || @guesses_left.zero?
  end

  def codebreaker_turn
    @codebreaker_guess = @codebreaker.take_guess
  end

  def codemaker_turn
    @codemaker_feedback = @codemaker.return_feedback(@codebreaker_guess)

    puts "Feedback: #{@codemaker_feedback.join(' ')}"
  end

  def result_of_game
    puts @codemaker_feedback == %w[B B B B] ? 'Codebreaker wins!' : 'Codebreaker loses!'
  end
end
