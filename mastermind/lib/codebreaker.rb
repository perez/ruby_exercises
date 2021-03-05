class Codebreaker
  def take_guess
    loop do
      print "Take a guess!\n> "

      codebreaker_input = input

      redo unless correct_format?(codebreaker_input)

      return codebreaker_input
    end
  end

  private

  def input
    $stdin.gets.strip.split('').map(&:to_i)
  end

  def correct_format?(input)
    (input.length < 5) && (input.uniq.length == 4) && (input.all?(1..6))
  end
end
