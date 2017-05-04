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
    game.player.remove_cards
    game.dealer.remove_cards
    game.player.bet
    game.dealer.bet
    game.first_hand
    bank_status(game)
    2.times { game.player.get_card(game.deck) }
    2.times { game.dealer.get_card(game.deck) }
    first_hand_status(game)
    next_hand(game)
  end

  def next_hand(game)
    next_hand_options
    option = gets.chomp.to_i
    case option
      when 1
        hit(game)
      when 2
        stand(game)
      when 9
        exit
      else
        next_hand(game)
    end
  end

  def hit(game)
    game.player.get_card(game.deck)
    player_status(game)
    game.player.get_score < 21 ? next_hand(game) : dealer_move(game)
  end

  def stand(game)
    player_status(game)
    dealer_move(game)
  end

  def dealer_move(game)
    dealer_status(game)
    dealer_score = game.dealer.get_score
    if dealer_score < 17
      game.dealer.get_card(game.deck)
      dealer_move(game)
    else
      game_final(game)
    end
  end

  def game_final(game)
    player_score = game.player.get_score
    dealer_score = game.dealer.get_score
    if player_score <= 21 && player_score > dealer_score
      player_won(game)
    elsif dealer_score <= 21 && dealer_score > player_score
      dealer_won(game)
    elsif player_score > 21
      dealer_won(game)
    elsif player_score = dealer_score
      draw(game)
    end
  end

  def player_won(game)
    game.player.balance += game.bank
    game.bank = 0
    game_status(game, "#{game.player.name} won!")
    sleep(2)
    first_hand(game)
  end

  def dealer_won(game)
    game.dealer.balance += game.bank
    game.bank = 0
    game_status(game, "Dealer won!")
    sleep(2)
    first_hand(game)
  end

  def draw(game)
    half_bank = game.bank
    game.bank = 0
    game.player.balance += half_bank
    game.dealer.balance += half_bank
    game_status(game, "Draw!")
    sleep(2)
    first_hand(game)
  end
end

main = Main.new
main.greetings_menu