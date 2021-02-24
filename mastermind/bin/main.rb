print "~~~~~~~~~~~~~~~~~~~~~ \n M A S T E R M I N D \n"
print "~~~~~~~~~~~~~~~~~~~~~ \n  Enter '1' to play  \n"
print "~~~~~~~~~~~~~~~~~~~~~ \n  Enter '2' to exit  \n"
print "~~~~~~~~~~~~~~~~~~~~~\n> "

loop do
  case $stdin.gets.strip.downcase
  when '1'
    puts 'Playing!'

    break
  when '2'
    puts 'Goodbye!'

    break
  else
    print "Invalid input! >:^(\n> "
  end
end
