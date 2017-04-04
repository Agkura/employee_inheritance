require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def initialize(symbol, board, pos)
    super
  end

  def to_s
    @symbol == :W ? "\u2657" : "\u265D"
  end

  def move_dirs
    diagonal_dir
  end

end
