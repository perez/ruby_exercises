require './lib/player'

RSpec.describe Player do
  describe '#to_s' do
    it 'returns the mark the player has been assigned' do
      player_one = Player.new('X')
      expect(player_one.to_s).to eql("This player's marker is X.")
    end
  end
end
