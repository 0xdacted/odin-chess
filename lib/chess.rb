
class Player
  def initialize(name)
    @name = name
    @pawn_one = Pawn.new
    @pawn_two = Pawn.new
    @pawn_three = Pawn.new
    @pawn_four = Pawn.new
    @pawn_five = Pawn.new
    @pawn_six = Pawn.new
    @pawn_seven = Pawn.new
    @pawn_eight = Pawn.new
    @rook_one = Rook.new
    @rook_two = Rook.new
    @knight_one = Knight.new
    @knight_two = Knight.new
    @bishop_one = Bishop.new
    @bishop_two = Bishop.new
    @queen = Queen.new
    @king = King.new
  end
end


class Board

  def initialize(player_one_name = 'Johnny', player_two_name = 'Bob')
    @board = Array.new(8) {Array.new(8)}
    @player_one = Player.new(player_one_name)
    @player_two = Player.new(player_two_name)
  end
end
