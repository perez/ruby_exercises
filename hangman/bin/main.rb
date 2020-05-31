require_relative '../lib/dictionary'
require_relative '../lib/hangman'

print "-----------------\n * * HANGMAN * * \n-----------------\nNew / Load / Exit\n-----------------\n~> "

dictionary = Dictionary.new('./lib/word_list.txt')
hangman = Hangman.new(dictionary.random_word)

loop do    
  case $stdin.gets.strip.downcase
  when 'new'
    hangman.play
  when 'load'
    hangman.load_game('save.yaml')
  when 'exit'
    exit
  else
    print "Please enter 'New', 'Load', or 'Exit':\n~> "
  end
end
