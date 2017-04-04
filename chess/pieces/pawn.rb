require_relative "piece"
require 'byebug'

class Pawn < Piece
  attr_accessor :pos

  def initialize(symbol, board, pos)
    super
    @start_row = true
  end

  def moves(pos)
    forward_steps.concat(side_attacks)
  end

  def to_s
    @symbol == :B ? "\u265F" : "\u2659"
  end

  protected

  def at_start_row?
    (@symbol == :W && pos[0] == 1) || (@symbol == :B && pos[0] == 6)
  end

  def forward_dir
    @symbol == :W ? true : false
  end

  def forward_steps
    row, col = @pos
    if @start_row && forward_dir
      [[0+row,1+col], [0+row,2+col]]
    elsif forward_dir
      [[0+row,1+col]]
    elsif @start_row
      [change([0,-1]),change([0,-2])]
    else
      [change([0,-1])]
    end
  end

  def side_attacks
    if forward_dir
      row,col = @pos
      [[-1+row,col + 1],[1+row,col + 1]]
    else
      row,col = @pos
      [[-1+row,col - 1],[1+row,col - 1]]
    end
  end

end
