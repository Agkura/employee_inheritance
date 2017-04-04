require_relative "piece"
require "singleton"

class NullPiece < Piece
  include 'Singleton'

  def moves
  end

  def to_s
    "N"
  end
end
