require_relative '../lib/merge'

RSpec.describe '#merge' do
  context 'when the arguments are two arrays that each contain one number' do
    it 'returns a new sorted array' do
      expect(merge([2], [1])).to eql([1, 2])
    end
  end

  context 'when the arguments are two arrays that each contain multiple numbers' do
    it 'returns a new sorted array' do
      expect(merge([3, 27, 38, 43], [9, 10, 82])).to eql([3, 9, 10, 27, 38, 43, 82])
    end
  end
end
