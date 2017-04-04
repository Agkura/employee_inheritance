require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def initialize(symbol, board, pos)
    super
  end

  def to_s
    @symbol == :W ? "\u2656" : "\u265C"
  end

  def move_dirs
    horizontal_dirs
  end
end
