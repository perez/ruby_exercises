print "Please enter the start square:\n~> "

start_square = nil

loop do
  input = $stdin.gets.strip.downcase

  case input
  when /^\d, ?\d$/
    start_square = input.split(',').map(&:to_i)

    break
  when 'exit'
    exit
  else
    print "Please enter a start square (e.g. '3, 4') or 'Exit' to exit the program:\n~> "
  end
end

print "Please enter the end square:\n~> "

end_square = nil

loop do
  input = $stdin.gets.strip.downcase

  case input
  when /^\d, ?\d$/
    end_square = input.split(',').map(&:to_i)

    break
  when 'exit'
    exit
  else
    print "Please enter an end square (e.g. '2, 3') or 'Exit' to exit the program:\n~> "
  end
end

puts "knight_moves(#{start_square}, #{end_square})"
