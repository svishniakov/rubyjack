require_relative 'mixins'
require_relative 'deck'
require_relative 'player'
require_relative 'game'

class Main
  include Mixins

  def greetings_menu
    greetings_menu_options
    @player = gets.chomp.to_s
    puts "\nHello #{@player}!"
    start_menu
  end

  def start_menu
    start_menu_options
    option = gets.chomp.to_i
    send(START_MENU[option] || wrong_option)
  end

  def start_game
    player = Player.new(@player)
    dealer = Player.new("Dealer")
    deck = Deck.new
    game = Game.new(player, dealer, deck)
    opponents(player, dealer)
    first_hand(game)
  end

  def first_hand(game)
    game.first_hand
    bank_status(game)
    2.times { game.player.get_card(game.deck) }
    2.times { game.dealer.get_card(game.deck) }

    puts "#{game.player.name} cards: #{game.player.player_cards}"
    puts "Dealer cards: #{game.dealer.player_cards}"
  end
end

main = Main.new
main.greetings_menu