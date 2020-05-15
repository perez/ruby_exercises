require './lib/bubble_sort'

RSpec.describe '#bubble_sort' do
  it 'returns a sorted array of several items' do
    expect(bubble_sort([4, 2, 3, 1])).to eql([1, 2, 3, 4])
  end

  it 'returns a sorted array of many items' do
    expect(bubble_sort([4, 3, 8, 5, 2, 7, 13, 9, 20, 11, 17, 12, 15, 18])).to eql([2, 3, 4, 5, 7, 8, 9, 11, 12, 13, 15, 17, 18, 20])
  end

  it 'returns an already sorted array' do
    expect(bubble_sort([4, 7, 13, 18, 23])).to eql([4, 7, 13, 18, 23])
  end

  it 'returns "Empty array" if the array contains no items' do
    expect(bubble_sort([])).to eql('Empty array')
  end
end
