require 'byebug'
require_relative 'pieces'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    fill_grid
  end

  def fill_grid
    @grid.each_index do |index|
      @grid[index].each_index do |idx|
        pos = [index, idx]
        if index == 0
          self[pos] = last_row_pieces[idx].new(:W, self, pos)
        elsif index == 1
          self[pos] = Pawn.new(:W, self, pos)
        elsif index == 6
          self[pos] = Pawn.new(:B, self, pos)
        elsif index == 7
          self[pos] = last_row_pieces[idx].new(:B, self, pos)
        else
          self[pos] = NullPiece.instance
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def move_piece(start, end_pos)
    raise "no piece" if self[start].nil?
    raise "out of bounds" if end_pos.none? {|int| int.between?(0,7) }

    self[end_pos], self[start] = self[start], self[end_pos]
    self[end_pos].pos = end_pos
  end

  def in_bounds?(pos)
    pos.all? {|int| int.between?(0,7)}
  end

  private



  def last_row_pieces
    [Rook,Knight,Bishop,King,Queen,Bishop,Knight,Rook]
  end


end
