class King
  attr_reader :piece
  attr_accessor :x, :y
  def initialize(piece, x, y)
    @piece = piece
    @x = x
    @y = y
  end
end

class Queen
  attr_reader :piece
  attr_accessor :x, :y
  def initialize(piece, x, y)
    @piece = piece
    @x = x
    @y = y
  end
end

class Bishop
  attr_reader :piece
  attr_accessor :x, :y
  def initialize(piece, x, y)
    @piece = piece
    @x = x
    @y = y
  end
end

class Knight
  attr_reader :piece
  attr_accessor :x, :y
  def initialize(piece, x, y)
    @piece = piece
    @x = x
    @y = y
  end
end

class Rook
  attr_reader :piece
  attr_accessor :x, :y
  def initialize(piece, x, y)
    @piece = piece
    @x = x
    @y = y
  end
end

class Pawn
  attr_reader :piece
  attr_accessor :x, :y
  def initialize(piece, x, y)
    @piece = piece
    @x = x
    @y = y
  end
end

class Player
  attr_reader :pawn_one, :pawn_two, :pawn_three, :pawn_four, :pawn_five, :pawn_six, :pawn_seven, :pawn_eight, :rook_one, :rook_two, :knight_one, :knight_two, :bishop_one, :bishop_two, :queen, :king
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
    @pawn_one = Pawn.new('♙', 1, 0)
    @pawn_two = Pawn.new('♙', 1, 1)
    @pawn_three = Pawn.new('♙', 1, 2)
    @pawn_four = Pawn.new('♙', 1, 3)
    @pawn_five = Pawn.new('♙', 1, 4)
    @pawn_six = Pawn.new('♙', 1, 5)
    @pawn_seven = Pawn.new('♙', 1, 6)
    @pawn_eight = Pawn.new('♙', 1, 7)
    @rook_one = Rook.new("♖", 0, 0)
    @rook_two = Rook.new("♖", 0, 7)
    @knight_one = Knight.new("♘", 0, 1)
    @knight_two = Knight.new("♘", 0, 6)
    @bishop_one = Bishop.new("♗", 0, 2)
    @bishop_two = Bishop.new("♗", 0, 5)
    @queen = Queen.new("♕", 0, 3)
    @king = King.new("♔", 0, 4)
  end

  def initialize_black_pieces
    @pawn_one = Pawn.new('♟', 6, 0)
    @pawn_two = Pawn.new('♟', 6, 1)
    @pawn_three = Pawn.new('♟', 6, 2)
    @pawn_four = Pawn.new('♟', 6, 3)
    @pawn_five = Pawn.new('♟', 6, 4)
    @pawn_six = Pawn.new('♟', 6, 5)
    @pawn_seven = Pawn.new('♟', 6, 6)
    @pawn_eight = Pawn.new('♟', 6, 7)
    @rook_one = Rook.new("♜", 7, 0)
    @rook_two = Rook.new("♜", 7, 7)
    @knight_one = Knight.new("♞", 7, 1)
    @knight_two = Knight.new("♞", 7, 6)
    @bishop_one = Bishop.new("♝", 7, 2)
    @bishop_two = Bishop.new("♝", 7, 5)
    @queen = Queen.new("♛", 7, 3)
    @king = King.new("♛", 7, 4)
  end
end


class Board
  attr_accessor :board
  attr_reader :player_one, :player_two
  def initialize(player_one_name = 'Johnny', player_one_color = 'white', player_two_name = 'Bob', player_two_color = 'black')
    @board = Array.new(8) {Array.new(8)}
    @player_one = Player.new(player_one_name, player_one_color)
    @player_two = Player.new(player_two_name, player_two_color)
    place_pieces
    p @board
  end

  def place_pieces
    place_player_one_pieces
    place_player_two_pieces
    
  end

  def place_player_one_pieces
   @board[@player_one.pawn_one.x][@player_one.pawn_one.y] = @player_one.pawn_one.piece
   @board[@player_one.pawn_two.x][@player_one.pawn_two.y] = @player_one.pawn_two.piece
   @board[@player_one.pawn_three.x][@player_one.pawn_three.y] = @player_one.pawn_three.piece
   @board[@player_one.pawn_four.x][@player_one.pawn_four.y] = @player_one.pawn_four.piece
   @board[@player_one.pawn_five.x][@player_one.pawn_five.y] = @player_one.pawn_five.piece
   @board[@player_one.pawn_six.x][@player_one.pawn_six.y] = @player_one.pawn_six.piece
   @board[@player_one.pawn_seven.x][@player_one.pawn_seven.y] = @player_one.pawn_seven.piece
   @board[@player_one.pawn_eight.x][@player_one.pawn_eight.y] = @player_one.pawn_eight.piece
   @board[@player_one.rook_one.x][@player_one.rook_one.y] = @player_one.rook_one.piece
   @board[@player_one.rook_two.x][@player_one.rook_two.y] = @player_one.rook_two.piece
   @board[@player_one.knight_one.x][@player_one.knight_one.y] = @player_one.knight_one.piece
   @board[@player_one.knight_two.x][@player_one.knight_two.y] = @player_one.knight_two.piece
   @board[@player_one.bishop_one.x][@player_one.bishop_one.y] = @player_one.bishop_one.piece
   @board[@player_one.bishop_two.x][@player_one.bishop_two.y] = @player_one.bishop_two.piece
   @board[@player_one.queen.x][@player_one.queen.y] = @player_one.queen.piece
   @board[@player_one.king.x][@player_one.king.y] = @player_one.king.piece
  end

  def place_player_two_pieces
    @board[@player_two.pawn_one.x][@player_two.pawn_one.y] = @player_two.pawn_one.piece
    @board[@player_two.pawn_two.x][@player_two.pawn_two.y] = @player_two.pawn_two.piece
    @board[@player_two.pawn_three.x][@player_two.pawn_three.y] = @player_two.pawn_three.piece
    @board[@player_two.pawn_four.x][@player_two.pawn_four.y] = @player_two.pawn_four.piece
    @board[@player_two.pawn_five.x][@player_two.pawn_five.y] = @player_two.pawn_five.piece
    @board[@player_two.pawn_six.x][@player_two.pawn_six.y] = @player_two.pawn_six.piece
    @board[@player_two.pawn_seven.x][@player_two.pawn_seven.y] = @player_two.pawn_seven.piece
    @board[@player_two.pawn_eight.x][@player_two.pawn_eight.y] = @player_two.pawn_eight.piece
    @board[@player_two.rook_one.x][@player_two.rook_one.y] = @player_two.rook_one.piece
    @board[@player_two.rook_two.x][@player_two.rook_two.y] = @player_two.rook_two.piece
    @board[@player_two.knight_one.x][@player_two.knight_one.y] = @player_two.knight_one.piece
    @board[@player_two.knight_two.x][@player_two.knight_two.y] = @player_two.knight_two.piece
    @board[@player_two.bishop_one.x][@player_two.bishop_one.y] = @player_two.bishop_one.piece
    @board[@player_two.bishop_two.x][@player_two.bishop_two.y] = @player_two.bishop_two.piece
    @board[@player_two.queen.x][@player_two.queen.y] = @player_two.queen.piece
    @board[@player_two.king.x][@player_two.king.y] = @player_two.king.piece
  end
end

board = Board.new



