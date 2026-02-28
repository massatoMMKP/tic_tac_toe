require_relative "player"
class ComputerPlayer < Player
  def move(board)
    best_score = -Float::INFINITY
    best_move = nil

    board.available_positions.each do |position|
      copy = board.deep_copy
      copy.place(position, @symbol)

      score = -negamax(copy, opponent_symbol(@symbol))

      puts "Jogada #{position} tem score #{score}"

      if score > best_score
        best_score = score
        best_move = position
      end
    end

    best_move
    
  end

  private

  def negamax(board, current_symbol)
    if board.winner == current_symbol
      return 1
    elsif board.winner == opponent_symbol(current_symbol)
      return -1
    elsif board.draw?
      return 0
    end

    best_score = -Float::INFINITY

    board.available_positions.each do |position|
      copy = board.deep_copy
      copy.place(position, current_symbol)

      score = -negamax(copy, opponent_symbol(current_symbol))

      best_score = [best_score, score].max
    end

    best_score
  end

  def opponent_symbol(symbol)
    symbol == "X" ? "O" : "X"
  end
end