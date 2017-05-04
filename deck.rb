class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    @values = [(2..10).to_a, 'J', 'Q', 'K', 'A'].flatten
    @suits = ["\u2661 ", "\u2662 ", "\u2667 ", "\u2664 "]
    @suits.each { |suit| @values.each { |value| @cards << "#{value} #{suit}"} }
  end
end