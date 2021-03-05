require_relative '../lib/game'
require_relative '../lib/codemaker'
require_relative '../lib/codebreaker'

print "~~~~~~~~~~~~~~~~~~~~~\n M A S T E R M I N D\n"
print "~~~~~~~~~~~~~~~~~~~~~\n  Enter '1' to play\n"
print "~~~~~~~~~~~~~~~~~~~~~\n  Enter '2' to exit\n"
print "~~~~~~~~~~~~~~~~~~~~~\n> "

loop do
  case $stdin.gets.strip
  when '1'
    puts '~~~~~~~~~~~~~~~~~~~~~'

    break
  when '2'
    exit
  else
    print "Invalid input!\n> "
  end
end

computer = Codemaker.new
player = Codebreaker.new

mastermind = Game.new(computer, player)
mastermind.play
