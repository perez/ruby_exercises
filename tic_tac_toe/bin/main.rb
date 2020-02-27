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

puts 'playing'
