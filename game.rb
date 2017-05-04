class Game
  attr_accessor :bank, :player, :dealer, :deck

  def initialize(player, dealer, deck)
    @player = player
    @dealer = dealer
    @deck = deck
    @bank = 0
  end

  def first_hand
    @bank = 20
  end
end