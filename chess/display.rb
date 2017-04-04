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
        @board[pos] = NullPiece.instance if @board[pos].nil?
        if pos == cursor.cursor_pos
          print @board[pos].to_s.colorize(:blue)
        else
          print @board[pos].to_s
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
  a.move_piece([0,0],[3,5])
  b.render
end
