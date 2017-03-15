require 'tic.rb'

describe Board do
  let(:board) do
    Board.new()
  end
  describe "#display" do
    it "displays board" do
      expect{board.display}.to output.to_stdout
    end
  end
  describe "#move" do
    context "board.move('1', 'a', 1)" do
      it "changes @board[1][a] to 1" do
        board.move('1', 'a', 1)
        expect(board.board[0][0]).to eql(1)
      end
    end
  end
  describe "#win_checker" do
    it "should return FALSE" do
      expect(board.win_checker).to eql(FALSE)
    end
    context "given player 1 winning conditions" do
      it "should return TRUE" do
        board.board = [[1,1,1],[0,0,0],[0,0,0]]
        expect(board.win_checker).to eql(TRUE)
      end
    end
    it "should return TRUE" do
      board.board = [[1,0,0],[0,1,0],[0,0,1]]
      expect(board.win_checker).to eql(TRUE)
    end
    it "should return TRUE" do
      board.board = [[1,0,0],[1,0,0],[1,0,0]]
      expect(board.win_checker).to eql(TRUE)
    end
  end
end
#describe "Game" do
#  load 'game.rb'
#  before do
#    $player1 = StringIO.new("Jan")
#    $player2 = StringIO.new("Michal")
#  end
#end
