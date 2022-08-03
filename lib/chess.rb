
class King
  def initialize(piece, position)
    @piece = piece
    @position = position
  end
end

class Queen
  def initialize(piece, position)
    @piece = piece
    @position = position
  end
end

class Bishop
  def initialize(piece, position)
    @piece = piece
    @position = position
  end
end

class Knight
  def initialize(piece, position)
    @piece = piece
    @position = position
  end
end

class Rook
  def initialize(piece, position)
    @piece = piece
    @position = position
  end
end

class Pawn
  def initialize(piece, position)
    @piece = piece
    @position = position
  end
end

class Player
  def initialize(name, color)
    @name = name
    @color = color
    if color.downcase == 'white'
      initialize_white_pieces
    elsif color.downcase == 'black'
      initialize_black_pieces
    end
  end

  def initialize_white_pieces
    @pawn_one = Pawn.new('♙', [1, 0])
    @pawn_two = Pawn.new('♙', [1, 1])
    @pawn_three = Pawn.new('♙', [1, 2])
    @pawn_four = Pawn.new('♙', [1, 3])
    @pawn_five = Pawn.new('♙', [1, 4])
    @pawn_six = Pawn.new('♙', [1, 5])
    @pawn_seven = Pawn.new('♙', [1, 6])
    @pawn_eight = Pawn.new('♙', [1, 7])
    @rook_one = Rook.new("♖", [0, 0])
    @rook_two = Rook.new("♖", [0, 7])
    @knight_one = Knight.new("♘", [0, 1])
    @knight_two = Knight.new("♘", [0, 6])
    @bishop_one = Bishop.new("♗", [0, 2])
    @bishop_two = Bishop.new("♗", [0, 5])
    @queen = Queen.new("♕", [0, 3])
    @king = King.new("♔", [0, 4])
  end

  def initialize_black_pieces
    @pawn_one = Pawn.new('♟', [6, 0])
    @pawn_two = Pawn.new('♟', [6, 1])
    @pawn_three = Pawn.new('♟', [6, 2])
    @pawn_four = Pawn.new('♟', [6, 3])
    @pawn_five = Pawn.new('♟', [6, 4])
    @pawn_six = Pawn.new('♟', [6, 5])
    @pawn_seven = Pawn.new('♟', [6, 6])
    @pawn_eight = Pawn.new('♟', [6, 7])
    @rook_one = Rook.new("♜", [7, 0])
    @rook_two = Rook.new("♜", [7, 7])
    @knight_one = Knight.new("♞", [7, 1])
    @knight_two = Knight.new("♞", [7, 6])
    @bishop_one = Bishop.new("♝", [7, 2])
    @bishop_two = Bishop.new("♝", [7, 5])
    @queen = Queen.new("♛", [7, 3])
    @king = King.new("♛", [7, 4])
  end
end


class Board
  def initialize(player_one_name = 'Johnny', player_one_color = 'white', player_two_name = 'Bob', player_two_color = 'black')
    @board = Array.new(8) {Array.new(8)}
    @player_one = Player.new(player_one_name, player_one_color)
    @player_two = Player.new(player_two_name, player_two_color)

  end

  def display
end
