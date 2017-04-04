require_relative 'piece'
require_relative 'stepable'

class King < Piece
  include Stepable

  def initialize(symbol, board, pos)
    super
  end

  def to_s
    @symbol == :W ? "\u2654" : "\u265A"
  end
end
