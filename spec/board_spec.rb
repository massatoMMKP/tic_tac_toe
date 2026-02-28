require_relative '../lib/game/board'

RSpec.describe Board do
  let(:board) { Board.new }

  describe "#place" do
    it "coloca símbolo em posição válida" do
      expect(board.place([0, 0], "X")).to be true
    end

    it "retorna false para posição inválida" do
      board.place([0, 0], "X")
      expect(board.place([0, 0], "O")).to be false
    end
  end

  describe "#winner" do
    it "detecta vencedor na linha" do
      board.place([0, 0], "X")
      board.place([0, 1], "X")
      board.place([0, 2], "X")

      expect(board.winner).to eq("X")
    end
  end

  describe "#game_over?" do
    it "retorna true quando há vencedor" do
      board.place([0, 0], "X")
      board.place([0, 1], "X")
      board.place([0, 2], "X")

      expect(board.game_over?).to be true
    end
  end
end