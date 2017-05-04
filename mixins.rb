module Mixins

  def greetings_menu_options
    puts "--- Welcome to RubyJack! ---\n\nPlease enter your name:"
  end

  def start_menu_options
    puts "\nDo you want to play?\n1 - Yes, 0 - No"
  end

  START_MENU = {
      1 => 'start_game',
      0 => 'exit'
  }

  def wrong_option
    puts '--- Wrong option was selected ---'
  end

  def opponents(player, dealer)
    puts "-" * 15
    puts "Opponents:"
    puts "#{player.name} - #{player.balance}"
    puts string = "#{dealer.name} - #{dealer.balance}"
    puts "-" * string.size
  end

  def bank_status(game)
    puts "\nTotal bank: #{game.bank}"
    puts "-" * 15
  end

  def player_status(game)
    puts "-" * 15
    puts "#{game.player.name} cards:"
    game.player.player_cards.each { |card| print card}
    puts " - score: #{game.player.get_score}"
    puts "-" * 15
  end

  def dealer_status(game)
    puts "-" * 15
    puts "Dealer cards:"
    game.dealer.player_cards.each { |card| print card}
    puts " - score: #{game.dealer.get_score}"
    puts "-" * 15
  end

  def first_hand_status(game)
    player_status(game)
    puts "\nDealer cards:"
    puts "* #{game.dealer.player_cards.last}"
    puts "-" * 15
  end

  def next_hand_options
    puts "Your move!"
    puts "1 - Hit, 2 - Stand, 9 - to stop the game"
    puts "-" * 15
  end
end