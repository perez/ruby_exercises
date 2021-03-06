require_relative '../lib/caesar_cipher'

RSpec.describe '#caesar_cipher' do
  it 'returns an empty string' do
    expect(caesar_cipher('', 2)).to eql('')
  end

  it 'returns a string shifted the correct amount of times' do
    expect(caesar_cipher('iggy', 3)).to eql('ljjb')
  end

  it 'returns several shifted words with spaces' do
    expect(caesar_cipher('gimme a break', 4)).to eql('kmqqi e fvieo')
  end

  it 'returns a string with the correct letter case' do
    expect(caesar_cipher('The World', 5)).to eql('Ymj Btwqi')
  end

  it 'returns a string shifted the opposite way if the shift factor is negative' do
    expect(caesar_cipher('Bites the Dust', -4)).to eql('Xepao pda Zqop')
  end
end
