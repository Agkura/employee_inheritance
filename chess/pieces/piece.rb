class Piece
  attr_accessor :symbol, :pos
  def initialize(symbol, board, pos)
    @symbol = symbol
    @board = board
    @pos = pos
  end

  def empty?
    is_a?(NullPiece)
  end

  def valid_moves(moves, check = true)
    valid = []
    moves.each do |move|
      if @board.in_bounds?(move) && @board[move].symbol != @symbol
        if check
          valid << move unless move_into_check?(move)
        else
          valid << move
        end
      end
    end
    valid
  end

  def to_s
    "P"
  end

  def move_into_check?(end_pos)
    #debugger
    new_board = @board.deep_dup
    new_board.move_piece!(@pos,end_pos)
    new_board.in_check?(@symbol)
  end


  def change(position)
    pos.each_with_index.map {|int, idx| position[idx] + int }
  end
end
