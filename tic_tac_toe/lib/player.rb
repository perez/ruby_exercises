class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    "This player's marker is #{@marker}."
  end
end
