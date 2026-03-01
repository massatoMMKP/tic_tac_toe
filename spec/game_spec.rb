require_relative "../lib/game/game"

RSpec.describe Game do
  let(:player1) { double("Player", symbol: "X") }
  let(:player2) { double("Player", symbol: "O") }

  let(:board) { double("Board") }

  subject(:game) do
    g = Game.new(player1, player2)
    g.instance_variable_set(:@board, board)
    g
  end

  describe "#play" do
    it "returns :finished when there is a winner" do
      allow(player1).to receive(:move).and_return([0, 0])
      allow(board).to receive(:place)
      allow(board).to receive(:display)
      allow(board).to receive(:winner).and_return("X")
      allow(board).to receive(:game_over?).and_return(true)

      expect(game.play).to eq(:finished)
    end

    it "returns :finished when there is a draw" do
      allow(player1).to receive(:move).and_return([0, 0])
      allow(board).to receive(:place)
      allow(board).to receive(:display)
      allow(board).to receive(:winner).and_return(nil)
      allow(board).to receive(:game_over?).and_return(true)

      expect(game.play).to eq(:finished)
    end
  end
end