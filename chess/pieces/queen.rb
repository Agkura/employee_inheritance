require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def initialize(symbol, board, pos)
    super
  end

  def to_s
    @symbol == :W ? "\u2655" : "\u265B"
  end


end
