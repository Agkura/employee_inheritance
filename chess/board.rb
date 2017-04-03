require 'byebug'
require_relative 'piece'

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
        if [0,1,6,7].include?(index)
          self[pos] = Piece.new("a")
        else
          self[pos] = Piece.new("b")
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start, end_pos)
    raise "no piece" if self[start].nil?
    raise "out of bounds" if end_pos.none? {|int| int.between?(0,7) }

    self[end_pos], self[start] = self[start], nil
  end

  def in_bounds?(pos)
    pos.all? {|int| int.between?(0,7)}
  end
end
