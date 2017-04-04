module Stepable

  def knight_dirs
    [[2,1],[2,-1],[-2,-1],[-2,1],[1,2],[-1,2],[1,-2],[-1,-2]]
  end

  def king_dirs
    [[0,1],[0,-1],[1,0],[-1,0],[1,1],[1,-1],[-1,-1],[-1,1]]
  end

  def moves
    all_moves = []
    if self.class == Knight
      knight_dirs.each do |pos|
        all_moves << change(pos)
      end
    else
      king_dirs.each do |pos|
        all_moves << change(pos)
      end
    end
    all_moves
  end

end
