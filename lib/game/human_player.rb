require_relative "player"

class HumanPlayer < Player
  def move(board)
    loop do
      puts "Digite linha e coluna (ex: 1 2) ou 'r' para reiniciar, 'q' para sair:"
      input = gets.chomp.downcase

      throw :restart if input == "r"
      throw :exit if input == "q"

      row, col = input.split.map(&:to_i)

      position = [row, col]

      return position if board.valid_move?(position)

      puts "Movimento inválido."
    end
  end
end