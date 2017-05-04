class Player

  attr_accessor :name, :balance, :player_cards

  def initialize(name)
    @name = name
    @balance = 100
    @player_cards = []
    @score = 0
  end

  def get_card(deck)
    @player_cards << deck.cards.delete(deck.cards.sample)
  end

  def remove_cards
    @player_cards = []
  end

  def get_score
    @player_cards.each do |card|
      card_value = card.split(' ')
      @score += card_value[0].to_i unless %w(J Q K A).include?(card_value[0])
      @score += 10 if %w(J Q K).include?(card_value[0])
      @score += 1 if card_value[0] == 'A' && @score + 11 > 21
      @score += 11 if card_value[0] == 'A' && @score + 11 <= 21
    end
    @score
  end
end