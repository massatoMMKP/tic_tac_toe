class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @board = Board.new
  end

  def play
    catch :exit do
      catch :restart do
        loop do
          play_turn

          if @board.game_over?
            show_result
            return :finished
          end

          switch_player
        end
      end
      return :restart
    end
    :exit
  end

  private

  def play_turn
    puts
    puts "\nTurno do jogador #{@current_player.symbol}"
    @board.display
    move = @current_player.move(@board)
    @board.place(move, @current_player.symbol)
  end

  def switch_player
    @current_player =
      @current_player == @player1 ? @player2 : @player1
  end

  def game_over?
   @board.game_over?
  end

  def show_result
    @board.display
    if @board.winner
      puts "Jogador #{@board.winner} venceu!"
    else
      puts "Empate!"
    end
    puts
  end
end