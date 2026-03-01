require_relative "../lib/game/board"

RSpec.describe Board do
  let(:board) { Board.new }

  describe "#valid_move?" do
    it "returns true for empty position" do
      expect(board.valid_move?([0, 0])).to be true
    end

    it "returns false for out of bounds" do
      expect(board.valid_move?([3, 3])).to be false
    end

    it "returns false for occupied position" do
      board.place([0, 0], "X")
      expect(board.valid_move?([0, 0])).to be false
    end
  end

  describe "#winner" do
    it "detects row win" do
      board.place([0, 0], "X")
      board.place([0, 1], "X")
      board.place([0, 2], "X")

      expect(board.winner).to eq("X")
    end

    it "detects column win" do
      board.place([0, 0], "O")
      board.place([1, 0], "O")
      board.place([2, 0], "O")

      expect(board.winner).to eq("O")
    end

    it "detects diagonal win" do
      board.place([0, 0], "X")
      board.place([1, 1], "X")
      board.place([2, 2], "X")

      expect(board.winner).to eq("X")
    end
  end

  describe "#draw?" do
    it "detects draw correctly" do
      moves = [
        [0,0,"X"], [0,1,"O"], [0,2,"X"],
        [1,0,"X"], [1,1,"O"], [1,2,"O"],
        [2,0,"O"], [2,1,"X"], [2,2,"X"]
      ]

      moves.each { |row, col, sym| board.place([row, col], sym) }

      expect(board.winner).to be_nil
      expect(board.draw?).to be true
    end
  end

  describe "#game_over?" do
    it "returns true when there is a winner" do
      board.place([0, 0], "X")
      board.place([0, 1], "X")
      board.place([0, 2], "X")

      expect(board.game_over?).to be true
    end

    it "returns true when there is a draw" do
      moves = [
        [0,0,"X"], [0,1,"O"], [0,2,"X"],
        [1,0,"X"], [1,1,"O"], [1,2,"O"],
        [2,0,"O"], [2,1,"X"], [2,2,"X"]
      ]

      moves.each { |row, col, sym| board.place([row, col], sym) }

      expect(board.game_over?).to be true
    end
  end

  describe "#deep_copy" do
    it "creates independent copy" do
      board.place([0, 0], "X")

      copy = board.deep_copy
      copy.place([1, 1], "O")

      expect(board.valid_move?([1, 1])).to be true
    end
  end
end