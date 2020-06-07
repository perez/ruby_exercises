require_relative '../lib/merge_sort'

RSpec.describe '#merge_sort' do
  context 'when the argument is an array with one number' do
    it 'returns the same array' do
      expect(merge_sort([3])).to eql([3])
    end
  end

  context 'when the argument is an array with two or more numbers' do
    it 'returns a new sorted array' do
      expect(merge_sort([3, 9, 4, 11, 7, 1])).to eql([1, 3, 4, 7, 9, 11])
    end
  end
end
