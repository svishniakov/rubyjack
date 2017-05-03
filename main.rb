require_relative 'mixins'
require_relative 'deck'
require_relative 'player'

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
    # Creating players
    player = Player.new(@player)
    dealer = Player.new("Dealer")
    # Deck initialization
    deck = Deck.new
    puts "Start game"
  end

  def restart_game
    puts "Restart game"
  end
end

main = Main.new
main.greetings_menu