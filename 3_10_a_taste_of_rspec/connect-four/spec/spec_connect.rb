require 'connect.rb'

describe Game do
  let(:game) do
    Game.new("player1", "player2")
  end
  describe "#players" do
    it "should return array of players" do
      expect(game.players).to eql(["player1", "player2"])
    end
  end
  describe "@board" do
    it "should return board" do
      expect(game.board.class).to eql(Board)
    end
  end
end
describe Board do
  let(:board) do
    Board.new
  end
  describe "#print" do
    it "should print table" do
      expect{board.print_table}.to output.to_stdout
    end
  end
  describe "#last_free" do
    context "given column id" do
      it "should return last free item" do
        expect(board.last_free(0)).to eql(0)
      end
    end
  end
  describe "#set" do
    context "given non-full column and player" do
      it "set cell to given player" do
        board.set(1, 1)
        expect(board.board_array[1][0]).to eql(1)
      end
    end
    context "given not existing column" do
      it "raises error" do
        expect{board.set(100, 1)}.to raise_error(ArgumentError)
      end
    end
    context "given not existing player (>2)"do
      it "raises error" do
        expect{board.set(1, 3)}.to raise_error(ArgumentError)
      end
    end
  end
end

