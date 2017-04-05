require 'byebug'
require_relative 'pieces'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    # fill_grid
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
        elsif index == 4 && idx == 4
          self[pos] = King.new(:W, self, pos)
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

  # check if an opponent's valid moves includes your king
  def in_check?(symbol)
    king_pos = find_king(symbol)
    opponents = opponent_pieces(symbol)
    opponents.each do |el|
      return true if el.valid_moves(el.moves, false).include?(king_pos)
    end
    false
  end

  def checkmate?(symbol)
    king = find_king(symbol)
    (in_check?(symbol) && king.valid_moves(king.moves).empty?)
  end

  def find_king(symbol)
    k = @grid.flatten.select do |el|
      el.class == King && el.symbol == symbol
    end
    k.first.pos
  end

  def opponent_pieces(symbol)
    @grid.flatten.select do |el|
      el.symbol != symbol unless el.empty?
    end
  end

  def player_pieces(symbol)
    @grid.flatten.select { |el| el.symbol == symbol }
  end


  def move_piece(start, end_pos)
    raise "no piece" if self[start].nil?
    raise "out of bounds" if end_pos.none? {|int| int.between?(0,7) }

    self[end_pos], self[start] = self[start], NullPiece.instance
    # self[end_pos] = self[start]
    self[end_pos].pos = end_pos
  end

  def in_bounds?(pos)
    pos.all? {|int| int.between?(0,7)}
  end

  def deep_dup
    new_board = Board.new
    @grid.each_index do |index|
      @grid[index].each_index do |idx|
        pos = [index, idx]
        piece = self[pos]
        symbol, clss = piece.symbol, piece.class
        new_board[pos] = clss.new(symbol, new_board, pos) unless clss == NullPiece
        if clss == NullPiece
          new_board[pos] = NullPiece.instance
        end
      end
    end
    new_board
  end

  def pieces
    @grid.flatten
  end

  def to_s
    @grid.each_index do |index|
      @grid[index].each_index do |idx|
        pos = [index, idx]
        print self[pos].to_s
      end
      print "\n"
    end
  end

  private

  def last_row_pieces
    [Rook,Knight,Bishop,Queen,Queen,Bishop,Knight,Rook]
  end


end
