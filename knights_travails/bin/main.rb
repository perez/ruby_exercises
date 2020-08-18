print "Please enter the start point:\n~> "

start_point = nil

loop do
  input = $stdin.gets.strip.downcase

  case input
  when /^[0-7], ?[0-7]$/
    start_point = input.split(',').map(&:to_i)

    break
  when 'exit'
    exit
  else
    print "Please enter a start point (e.g. '3, 4') or 'Exit' to exit the program:\n~> "
  end
end

print "Please enter the end point:\n~> "

end_point = nil

loop do
  input = $stdin.gets.strip.downcase

  case input
  when /^[0-7], ?[0-7]$/
    end_point = input.split(',').map(&:to_i)

    break
  when 'exit'
    exit
  else
    print "Please enter an end point (e.g. '2, 3') or 'Exit' to exit the program:\n~> "
  end
end
