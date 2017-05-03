require_relative 'mixins'

class Main
  include Mixins

  def greetings_menu
    greetings_menu_options
    player = gets.chomp.to_s
    puts "\nHello #{player}!"
    start_menu
  end

  def start_menu
    start_menu_options
    option = gets.chomp.to_i
    send(START_MENU[option] || wrong_option)
  end

  def start_game
    puts "Start game"
  end

  def restart_game
    puts "Restart game"
  end
end

main = Main.new
main.greetings_menu