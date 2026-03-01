require_relative "../lib/game/human_player"

RSpec.describe HumanPlayer do
  let(:board) { double("Board") }
  let(:player) { HumanPlayer.new("X") }

  describe "#move" do
    it "returns position when input is valid" do
      allow(board).to receive(:valid_move?).and_return(true)
      allow(player).to receive(:gets).and_return("1 2\n")

      result = catch(:exit) do
        catch(:restart) do
          player.move(board)
        end
      end

      expect(result).to eq([1, 2])
    end

    it "throws :exit when user types q" do
      allow(player).to receive(:gets).and_return("q\n")

      expect {
        catch(:exit) { player.move(board) }
      }.not_to raise_error
    end

    it "throws :restart when user types r" do
      allow(player).to receive(:gets).and_return("r\n")

      expect {
        catch(:restart) { player.move(board) }
      }.not_to raise_error
    end
  end
end