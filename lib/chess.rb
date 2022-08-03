
class King
  def initialize(color)
    color == 'white' ? @self = "♔" : @self = "♚"
  end
end

class Queen
  def initialize(color)
    color == 'white' ? @self = "♕" : @self = "♛"

  end
end

class Bishop
  def initialize(color)
    color == 'white' ? @self = "♗" : @self = "♝"
  end
end

class Knight
  def initialize(color)
    color == 'white' ? @self = "♘" : @self = "♞"
  end
end

class Rook
  def initialize(color)
    color == 'white' ? @self = "♖" : @self = "♜"
  end
end

class Pawn
  def initialize(color)
    if color == 'white'
      @self = "♙"
    elsif color == 'black'
      @self = "♟"
    end
  end
end

class Player
  def initialize(name, color)
    @name = name
    @color = color
    @pawn_one = Pawn.new(color)
    @pawn_two = Pawn.new(color)
    @pawn_three = Pawn.new(color)
    @pawn_four = Pawn.new(color)
    @pawn_five = Pawn.new(color)
    @pawn_six = Pawn.new(color)
    @pawn_seven = Pawn.new(color)
    @pawn_eight = Pawn.new(color)
    @rook_one = Rook.new(color)
    @rook_two = Rook.new(color)
    @knight_one = Knight.new(color)
    @knight_two = Knight.new(color)
    @bishop_one = Bishop.new(color)
    @bishop_two = Bishop.new(color)
    @queen = Queen.new(color)
    @king = King.new(color)
  end
end


class Board
  def initialize(player_one_name = 'Johnny', player_two_name = 'Bob')
    @board = Array.new(8) {Array.new(8)}
    @player_one = Player.new(player_one_name, 'white')
    @player_two = Player.new(player_two_name, 'black')

  end

  def display
end
