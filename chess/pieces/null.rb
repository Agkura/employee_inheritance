require_relative "piece"
require "singleton"

class NullPiece < Piece
  include Singleton
  attr_reader :symbol

  def initialize
    @symbol = :N
  end

  def to_s
    "\u25A1"
  end
end
