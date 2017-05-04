class Player

  attr_accessor :name, :balance, :player_cards

  def initialize(name)
    @name = name
    @balance = 100
    @player_cards = []
  end

  def get_card(deck)
    @player_cards << deck.cards.delete(deck.cards.sample)
  end

  def remove_cards
    @player_cards = []
  end
end