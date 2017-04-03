require_relative "board"
require_relative "cursor"
require "colorize"

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each_index do |index|
      @board.grid[index].each_index do |idx|
        pos = [index, idx]
        if pos == cursor.cursor_pos
          print @board[pos].to_s.colorize(:blue)
        else
          print @board[pos]
        end
      end
      print "\n"
    end

  end

end

if __FILE__ == $0
  a = Board.new
  b = Display.new(a)
  b.render
  20.times do |int|
    b.cursor.get_input
    b.render
  end
end
