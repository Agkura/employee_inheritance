require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable

  def initialize(symbol, board, pos)
    super
  end

  def to_s
    @symbol == :W ? "\u2658" : "\u265E"
  end
end
