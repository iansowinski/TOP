class  Board
  attr_reader :root, :accessor
  def initialize
    @root = Node.new(0,0, nil, nil, nil, nil)
    @accessor = []
    node = @root
    col = 0
    row = 0
    r = true
    while row < 8 and col < 8
      while r == true
        if col == 7
          print "#{node.row}#{node.col} "
          row += 1
          node.right = nil
          node.left.right = node
          node.down = Node.new(col, row, node, nil,nil,nil)
          node = node.down
          r = false
          puts ""
        else
          print "#{node.row}#{node.col} "
          col += 1
          node.right = Node.new(col, row, nil, nil, node, nil) if row == 0
          node.right = Node.new(col, row, node.up.right, nil, node, nil) if row != 0 and col != 0
          node.right = Node.new(col, row, node.up.right, nil, node, nil) if row != 0 and col == 0
          node = node.right
          node.left.right = node
          node.up.down = node if row != 0
        end
      end
      while r == false
        if col == 0
          print "#{node.row}#{node.col} "
          puts ""
          row += 1
          node.left = nil
          node.right.left = node
          node.down = Node.new(col, row, node, nil,nil,nil)
          node = node.down
          r = true
        else
          print "#{node.row}#{node.col} "
          col -= 1
          node.left = Node.new(col, row, nil, nil, nil, node) if row == 7
          node.left = Node.new(col, row, node.up.left, nil, nil, node) if row != 7 and col != 7
          node.left = Node.new(col, row, node.up.left, nil, nil, node) if row != 7 and col == 7
          node = node.left
          node.right.left = node
          node.up.down = node if row != 7
        end
      end
    end
  end
  def find(col, row)
    node = @root
    loop do
      return node if node.col == col and node.row == row
      node = node.right if col > node.col
      node = node.left if col < node.col
      node = node.down if row > node.row
      node = node.up if row < node.row
    end
  end
end
class Node
  attr_accessor :up,:down,:left, :right, :col, :row
  def initialize (col=0, row=0,up=nil,down=nil,left=nil,right=nil)
    @col = col
    @row = row
    @up = up
    @down = down
    @left = left
    @right = right
  end
end
board = Board.new()
puts ""
puts ""
# print board.find(1,1)
print board.find(3, 7)
8.times do |i|
  8.times do |j|
    print board.find(i, j).col
    print board.find(i, j).row
    print " "
  end
  puts ""
end

puts ""