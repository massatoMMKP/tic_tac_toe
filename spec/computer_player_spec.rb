require_relative "../lib/game/board"
require_relative "../lib/game/computer_player"

RSpec.describe ComputerPlayer do
  let(:board) { Board.new }
  let(:computer) { ComputerPlayer.new("X") }

  describe "#move" do
    it "returns a valid available position" do
      board.place([0, 0], "O")
      board.place([1, 1], "X")

      move = computer.move(board)

      expect(board.valid_move?(move)).to be true
    end

    it "chooses winning move when available" do
      board.place([0, 0], "X")
      board.place([0, 1], "X")
      board.place([1, 0], "O")
      board.place([1, 1], "O")

      move = computer.move(board)

      expect(move).to eq([0, 2])
    end

    it "blocks opponent winning move" do
      board.place([0, 0], "O")
      board.place([0, 1], "O")
      board.place([1, 0], "X")

      move = computer.move(board)

      expect(move).to eq([0, 2])
    end
  end
end