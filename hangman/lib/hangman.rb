require_relative './serializable'

class Hangman
  include Serializable

  def initialize(secret_word)
    @secret_word = secret_word.split('')
    @guesses = []
    @guesses_left = secret_word.length + 4
    @current_guess = Array.new(secret_word.length, '_')
  end

  private

  def display_guesses
    puts "-----------------\n#{@current_guess.join}"

    puts "Letters guessed: #{@guesses.join(', ')}"

    puts "Guesses left: #{@guesses_left}"
  end

  def update_guesses(input)
    @guesses << input

    @guesses_left -= 1
  end
  
  def store_input
    print "Guess a letter: "

    input = $stdin.gets.strip.downcase
  end

  def bad_input?(input)
    unless input.match?(/^[a-z]$/)
      puts 'Incorrect input!'

      true
    end
  end

  def letter_previously_guessed?(input)
    if @guesses.include?(input)
      puts 'Letter already guessed!'

      true
    end
  end

  def letter_correctly_guessed?(input)
    if @secret_word.include?(input)
      @secret_word.each_with_index do |letter, i|
        input == letter ? @current_guess[i] = letter : next
      end

      true
    end
  end

  def lost?
    if @guesses_left == 0
      puts "#{@current_guess.join}\nToo many tries, you lose!"

      true
    end
  end

  def won?
    if @current_guess == @secret_word
      puts "#{@current_guess.join}\nYou've guessed correctly, you win!"

      true
    end
  end

  def game_over?
    lost? || won?
  end

  def save_game
    self.serialize

    puts 'Game saved!'
  end

  public

  def load_game(file)
    if File.exist?(file)
      puts "-----------------\nLoading game..."

      self.deserialize(file).play
    else
      puts "-----------------\nNo save found, starting a new game..."

      self.play
    end
  end

  def play    
    until game_over?
      display_guesses

      input = store_input

      exit if input == 'exit'
      
      save_game if input == 'save'

      next if input == 'save'
      
      redo if (letter_previously_guessed?(input) || bad_input?(input))

      letter_correctly_guessed?(input)
      
      update_guesses(input)
    end

    exit
  end
end
