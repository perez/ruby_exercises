class Game
  def initialize(codemaker, codebreaker)
    @codemaker = codemaker
    @codebreaker = codebreaker
    @guesses_left = 12
    @codebreaker_guess = nil
    @codemaker_feedback = nil
  end
end
