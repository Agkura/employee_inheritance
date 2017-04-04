class Piece
  def initialize(symbol, board, pos)
    @symbol = symbol
    @board = board
    @pos = pos
  end

  def empty?
    @board[@pos].is_a?(NullPiece)
  end

  def valid_moves(moves)
    valid = []
    moves.each do |move|
      valid << move if @board.in_bounds?(move) && @board[move].symbol != self.symbol
    end
    valid
  end

  def to_s
    "P"
  end

  def move_into_check?(to_pos)
    # moves = valid_moves(to_pos)
    # moves.each do |move|
    #   if move
  end

  def change(position)
    pos.each_with_index.map {|int, idx| position[idx] + int }
  end
end
