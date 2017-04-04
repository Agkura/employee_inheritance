require 'byebug'
module Slideable
  def moves
    all_moves = []
    move_dirs.each do |move|
      all_moves.concat(grow_unblocked_moves_in_dir(move[0], move[1]))
    end
    all_moves
  end

  private

  def move_dirs
    horizontal_dirs + diagonal_dir
  end

  def horizontal_dirs
    [[0,1],[0,-1],[1,0],[-1,0]]
  end

  def diagonal_dir
    [[1,1],[1,-1],[-1,-1],[-1,1]]
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    unblocked = []
    cur_x,cur_y = @pos
    cur_x, cur_y = cur_x + dx, cur_y + dy
    loop do
      # debugger
      pos = [cur_x,cur_y]
      break unless @board.in_bounds?(pos) && @board[pos].empty?

      unblocked << pos
      cur_x += dx
      cur_y += dy
    end
    unblocked
  end

end
