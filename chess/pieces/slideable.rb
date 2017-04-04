module Slideable
  def moves
  end

  private

  def move_dirs
  end

  def horizontal_dirs
    row, col = pos
    [[row, col-1],[row, col+1], [row+1, col], [row - 1, col]]
  end

  def diagonal_dir
    row, col = pos
    [change([1,1]), change([1,-1]), change([-1,1]), change([-1,-1])]
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    
  end
end
