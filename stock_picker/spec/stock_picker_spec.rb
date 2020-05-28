require './lib/stock_picker'

RSpec.describe '#stock_picker' do
  it 'returns a pair of prices representing the best days to buy and sell stocks' do
    expect(stock_picker([20,2,19,8,9,25,4,16,10])).to eql([1,5])
  end

  it 'returns a correct pair of prices when the lowest day is last' do
    expect(stock_picker([20,7,22,7,4,23,16,25,2])).to eql([4,7])
  end

  it 'returns a correct pair of prices when the highest day is first' do
    expect(stock_picker([17,16,3,6,9,15,8,1,10])).to eql([2,5])
  end
end
