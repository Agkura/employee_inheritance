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
        # @board[pos] = NullPiece.instance if @board[pos].nil?
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
  a.fill_grid
  b = Display.new(a)
  b.render
  p a[[4,4]].valid_moves(a[[4,4]].moves)
  # c = a.deep_dup
  # d = Display.new(c)
  # d.render
  # c.move_piece([4,4],[4,5])
  # p c[[4,4]].pos
  # p c[[4,5]]
  # d.render
  # p c[[4,5]].valid_moves(c[[4,5]].moves)
  # p b.render
  # p a[[4,4]].pos
  # p a[[4,4]].moves
  # a.move_piece([4,4], [7,1])
  # b.render


end
