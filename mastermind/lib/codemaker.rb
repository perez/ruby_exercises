class Codemaker
  def initialize
    @secret_code = generate_code
  end

  def return_feedback(codebreaker_guess)
    feedback = Array.new

    compare_guess_to_secret_code(codebreaker_guess, feedback)

    feedback.shuffle
  end

  private

  def generate_code
    [*1..6].sample(4)
  end

  def compare_guess_to_secret_code(guess, array)
    guess.each_with_index do |number, index|
      if number == @secret_code[index]
        array << 'B'
      elsif @secret_code.include?(number)
        array << 'W'
      else
        next
      end
    end
  end
end
