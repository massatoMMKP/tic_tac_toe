require_relative "player"

class HumanPlayer < Player
  def move(board)
    loop do
      print "Digite linha e coluna (ex: 1 2) ou 'r' para reiniciar, 'q' para sair: "
      input = gets.chomp.strip

      throw :exit if input.downcase == 'q'
      throw :restart if input.downcase == 'r'

      parts = input.split

      unless parts.size == 2 && parts.all? { |p| p.match?(/^\d+$/) }
        puts "Entrada inválida. Digite dois números."
        next
      end

      row, col = parts.map(&:to_i)

      unless board.valid_move?([row, col])
        puts "Movimento inválido."
        next
      end

      return [row, col]
    end
  end
end