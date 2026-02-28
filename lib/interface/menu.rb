require_relative "../game/human_player"
require_relative "../game/computer_player"
class Menu
  def start
    show_options
    choice = ask_valid_option
    create_players(choice)
  end

  private

  def show_options
    puts "Escolha o modo de jogo:"
    puts "1 - Humano vs Humano"
    puts "2 - Humano vs Computador"
    puts "3 - Computador vs Computador"
  end

  def ask_valid_option
    loop do
      print "Opção: "
      choice = gets.chomp
      return choice if ["1", "2", "3"].include?(choice)
      puts "Opção inválida."
    end
  end

  def create_players(choice)
    case choice
    when "1"
      human_vs_human
    when "2"
      human_vs_computer
    when "3"
      computer_vs_computer
    end
  end

  def human_vs_human
    [HumanPlayer.new("X"), HumanPlayer.new("O")]
  end

  def computer_vs_computer
    [
      ComputerPlayer.new("X"),
      ComputerPlayer.new("O")
    ]
  end

  def human_vs_computer
    loop do
      puts "Você quer ser X ou O?"
      symbol = gets.chomp.upcase

      return [
        HumanPlayer.new("X"),
        ComputerPlayer.new("O")
      ] if symbol == "X"

      return [
        ComputerPlayer.new("X"),
        HumanPlayer.new("O")
      ] if symbol == "O"

      puts "Símbolo inválido."
    end
  end
end