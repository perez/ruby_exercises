require_relative '../lib/dictionary'

RSpec.describe Dictionary do
  before { @dictionary = Dictionary.new('./lib/word_list.txt') }

  describe '#random_word' do
    it 'returns a word from the words array' do
      allow(@dictionary).to receive(:random_word).and_return('mountain')

      expect(@dictionary.random_word).to eql('mountain')
    end

    it 'returns a word 4 to 12 characters long' do
      expect(@dictionary.random_word.length).to be_between(4, 12)
    end
  end
end
