require './lib/substrings'

RSpec.describe '#substrings' do
  before { @dictionary = %w[below down go going horn how howdy it i low own part partner sit] }
  
  context 'when the first argument is a one word string' do
    it 'returns a hash listing each substring and how many times it occurred in the first argument' do
      expect(substrings('below', @dictionary)).to eql({'below'=>1, 'low'=>1})
    end
  end

  context 'when the first argument is a multiple word string' do
    it 'returns a hash listing each substring and how many times it occurred in the first argument' do
      expect(substrings('sit down', @dictionary)).to eql({'down'=>1, 'it'=>1, 'i'=>1, 'own'=>1, 'sit'=>1})
    end
  end

  context 'when the first argument includes uppercase letters and puncuation' do
    it 'returns a hash listing each substring and how many times it occurred in the first argument' do
      expect(substrings("how's it going?", @dictionary)).to eql({'go'=>1, 'going'=>1, 'how'=>1, 'it'=>1, 'i'=>2})
    end
  end
end
