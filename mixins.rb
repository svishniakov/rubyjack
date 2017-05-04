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
    puts "------------"
    puts "Opponents:"
    puts "#{player.name} - #{player.balance}"
    puts string = "#{dealer.name} - #{dealer.balance}"
    puts "-" * string.size
  end

  def bank_status(game)
    puts "Total bank: #{game.bank}"
  end
end