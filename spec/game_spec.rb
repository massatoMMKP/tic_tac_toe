require_relative '../lib/game/game'
require_relative '../lib/game/board'

RSpec.describe Game do
  let(:player1) { double("Player", symbol: "X", move: [0, 0]) }
  let(:player2) { double("Player", symbol: "O", move: [1, 1]) }

  let(:game) { Game.new(player1, player2) }

  describe "#play" do
    it "retorna :finished quando o jogo termina" do
      board = game.instance_variable_get(:@board)

      allow(player1).to receive(:move).and_return([0, 0])
      allow(player2).to receive(:move).and_return([1, 0])

      board.place([0, 1], "X")
      board.place([0, 2], "X")

      expect(game.play).to eq(:finished)
    end
  end

  describe "switch_player (via reflection)" do
    it "alterna o jogador atual" do
      current = game.instance_variable_get(:@current_player)

      game.send(:switch_player)

      expect(game.instance_variable_get(:@current_player))
        .not_to eq(current)
    end
  end
end