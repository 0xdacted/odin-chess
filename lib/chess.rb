class Piece 
  attr_reader :piece, :color
  attr_accessor :x, :y
  def initialize(piece, x, y, color)
    @color = color
    @piece = piece
    @x = x
    @y = y
  end
end

class King < Piece
  def initialize(piece, x, y, color)
    super
    @moveset 
  end
end

class Queen < Piece
  def initialize(piece, x, y, color)
    super
    @moveset 
  end
end

class Bishop < Piece
  def initialize(piece, x, y, color)
    super
    @moveset 
  end
end

class Knight < Piece
  def initialize(piece, x, y, color)
    super
    @moveset 
  end
end

class Rook < Piece
  def initialize(piece, x, y, color)
    super
    @moveset = []
    @moved = false
  end

  def move_right(board, x, y)
    @color == 'white' ? return unless y <= 7 : return unless y >= 0
    @color == 'white' ? y + 1 : y - 1
    if board[x][y].nil?
      @moveset << [x, y]
      move_right(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      return
    else
      return
    end
  end

  def move_left(board, x, y)
    @color == 'white' ? return unless y >= 0 : return unless y <= 7
    @color == 'white' ? y - 1 : y + 1
    if board[x][y].nil?
      @moveset << [x, y]
      move_left(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      return
    else
      return
    end
  end

  def move_forward(board, x, y)
    @color == 'white' ? return unless x <= 7 : return unless x >= 0
    @color == 'white' ? x + 1 : x - 1
    if board[x][y].nil?
      @moveset << [x, y]
      move_forward(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      return
    else
      return
    end
  end

  def move_backward(board, x, y)
    @color == 'white' ? return unless x >= 0 : return unless x <= 7
    @color == 'white' ? x - 1 : x + 1
    if board[x][y].nil?
      @moveset << [x, y]
      move_backward(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      return
    else
      return
    end
  end

end

class Pawn < Piece
  def initialize(piece, x, y, color)
    super
    @moveset = []
    @moved = false 
    @double_moved = false
  end

  def single_move(board, x, y)
    @color == 'white' ? x + 1 : x - 1
    return unless board[x][y].nil? 
    @moveset << [x, y]
  end

  def double_move(board, x, y)
    return unless @moved == false 
    @color == 'white' ? x + 1 : x - 1
    return unless board[x][y].nil?
    @color == 'white' ? x + 1 : x - 1
    return unless board[x][y].nil?
    @moveset << [x, y]
  end

  def capture_right(board, x, y)
    @color == 'white' ? x + 1 && y + 1 : x - 1 && y - 1
    return unless !board[x][y].nil? && board[x][y].color != @color
    @moveset << [x, y]
  end

  def capture_left(board, x, y)
    @color == 'white' ? x + 1 && y -1 : x - 1 && y + 1
    return unless !board[x][y].nil? && board[x][y].color != @color
    @moveset << [x, y]
  end

  def en_passant_right(board, x, y)
    @color == 'white' ? y + 1 : y - 1
    return unless board[x][y].class == Pawn && board[x][y].color != @color && board[x][y].double_moved == true
    @color == 'white' ? x + 1 : x - 1
    @moveset << [x, y]
  end

  def en_passant_left(board, x, y)
    @color == 'white' ? y - 1 : y + 1
    return unless board[x][y].class == Pawn && board[x][y].color != @color && board[x][y].double_moved == true
    @color == 'white' ? x - 1 : x + 1
    @moveset << [x, y]
  end

  def possible_moves(board, x, y)
    single_move(board, x, y)
    double_move(board, x, y)
    capture_right(board, x, y)
    capture_left(board, x, y)
    en_passant_right(board, x, y)
    en_passant_left(board, x, y)
  end

  def choose_move([x, y])
    if @moveset.bsearch {|i| i == [x, y]} == true
      puts "You have moved #{self.piece} from #{[@x, @y]}to #{[x, y]}"
     if @color == 'white' && @x + 2 == x
      @double_moved = true
     elsif @color == 'black' && @x - 2 == x
      @double_moved = true
     else
      @double_moved = false
     end
     @moved = true
     @x = x
     @y = y
    else
      return false
    end
  end
  
  def clear_moveset
    @moveset = []
  end
end

class Player
  attr_reader :pawn_one, :pawn_two, :pawn_three, :pawn_four, :pawn_five, :pawn_six, :pawn_seven, :pawn_eight, :rook_one, :rook_two, :knight_one, :knight_two, :bishop_one, :bishop_two, :queen, :king
  def initialize(name, color)
    @name = name
    @color = color.downcase
    @color == 'white' ? initialize_white_pieces : initialize_black_pieces
  end

  def initialize_white_pieces
    @pawn_one = Pawn.new('♙', 1, 0, 'white')
    @pawn_two = Pawn.new('♙', 1, 1, 'white')
    @pawn_three = Pawn.new('♙', 1, 2, 'white')
    @pawn_four = Pawn.new('♙', 1, 3, 'white')
    @pawn_five = Pawn.new('♙', 1, 4, 'white')
    @pawn_six = Pawn.new('♙', 1, 5, 'white')
    @pawn_seven = Pawn.new('♙', 1, 6, 'white')
    @pawn_eight = Pawn.new('♙', 1, 7, 'white')
    @rook_one = Rook.new("♖", 0, 0, 'white')
    @rook_two = Rook.new("♖", 0, 7, 'white')
    @knight_one = Knight.new("♘", 0, 1, 'white')
    @knight_two = Knight.new("♘", 0, 6, 'white')
    @bishop_one = Bishop.new("♗", 0, 2, 'white')
    @bishop_two = Bishop.new("♗", 0, 5, 'white')
    @queen = Queen.new("♕", 0, 3, 'white')
    @king = King.new("♔", 0, 4, 'white')
  end

  def initialize_black_pieces
    @pawn_one = Pawn.new('♟', 6, 0, 'black')
    @pawn_two = Pawn.new('♟', 6, 1, 'black')
    @pawn_three = Pawn.new('♟', 6, 2, 'black')
    @pawn_four = Pawn.new('♟', 6, 3, 'black')
    @pawn_five = Pawn.new('♟', 6, 4, 'black')
    @pawn_six = Pawn.new('♟', 6, 5, 'black')
    @pawn_seven = Pawn.new('♟', 6, 6, 'black')
    @pawn_eight = Pawn.new('♟', 6, 7, 'black')
    @rook_one = Rook.new("♜", 7, 0, 'black')
    @rook_two = Rook.new("♜", 7, 7, 'black')
    @knight_one = Knight.new("♞", 7, 1, 'black')
    @knight_two = Knight.new("♞", 7, 6, 'black')
    @bishop_one = Bishop.new("♝", 7, 2, 'black')
    @bishop_two = Bishop.new("♝", 7, 5, 'black')
    @queen = Queen.new("♛", 7, 3, 'black')
    @king = King.new("♛", 7, 4, 'black')
  end

  def observe_board(board)
    @board = board
  end
end


class Board
  attr_accessor :board
  attr_reader :player_one, :player_two
  def initialize(board = Array.new(8) {Array.new(8)}, player_one_name, player_one_color, player_two_name, player_two_color)
    @board = board
    @player_one = Player.new(player_one_name, player_one_color)
    @player_two = Player.new(player_two_name, player_two_color)
    set_board
  end

  def set_board
    set_player_one_pieces
    set_player_two_pieces
  end

  def transmit_board
    @player_one.observe_board(board = @board)
    @player_two.observe_board(board = @board)
  end

  def set_player_one_pieces
   @board[@player_one.pawn_one.x][@player_one.pawn_one.y] = @player_one.pawn_one
   @board[@player_one.pawn_two.x][@player_one.pawn_two.y] = @player_one.pawn_two
   @board[@player_one.pawn_three.x][@player_one.pawn_three.y] = @player_one.pawn_three
   @board[@player_one.pawn_four.x][@player_one.pawn_four.y] = @player_one.pawn_four
   @board[@player_one.pawn_five.x][@player_one.pawn_five.y] = @player_one.pawn_five
   @board[@player_one.pawn_six.x][@player_one.pawn_six.y] = @player_one.pawn_six
   @board[@player_one.pawn_seven.x][@player_one.pawn_seven.y] = @player_one.pawn_seven
   @board[@player_one.pawn_eight.x][@player_one.pawn_eight.y] = @player_one.pawn_eight
   @board[@player_one.rook_one.x][@player_one.rook_one.y] = @player_one.rook_one
   @board[@player_one.rook_two.x][@player_one.rook_two.y] = @player_one.rook_two
   @board[@player_one.knight_one.x][@player_one.knight_one.y] = @player_one.knight_one
   @board[@player_one.knight_two.x][@player_one.knight_two.y] = @player_one.knight_two
   @board[@player_one.bishop_one.x][@player_one.bishop_one.y] = @player_one.bishop_one
   @board[@player_one.bishop_two.x][@player_one.bishop_two.y] = @player_one.bishop_two
   @board[@player_one.queen.x][@player_one.queen.y] = @player_one.queen
   @board[@player_one.king.x][@player_one.king.y] = @player_one.king
  end

  def set_player_two_pieces
    @board[@player_two.pawn_one.x][@player_two.pawn_one.y] = @player_two.pawn_one
    @board[@player_two.pawn_two.x][@player_two.pawn_two.y] = @player_two.pawn_two
    @board[@player_two.pawn_three.x][@player_two.pawn_three.y] = @player_two.pawn_three
    @board[@player_two.pawn_four.x][@player_two.pawn_four.y] = @player_two.pawn_four
    @board[@player_two.pawn_five.x][@player_two.pawn_five.y] = @player_two.pawn_five
    @board[@player_two.pawn_six.x][@player_two.pawn_six.y] = @player_two.pawn_six
    @board[@player_two.pawn_seven.x][@player_two.pawn_seven.y] = @player_two.pawn_seven
    @board[@player_two.pawn_eight.x][@player_two.pawn_eight.y] = @player_two.pawn_eight
    @board[@player_two.rook_one.x][@player_two.rook_one.y] = @player_two.rook_one
    @board[@player_two.rook_two.x][@player_two.rook_two.y] = @player_two.rook_two
    @board[@player_two.knight_one.x][@player_two.knight_one.y] = @player_two.knight_one
    @board[@player_two.knight_two.x][@player_two.knight_two.y] = @player_two.knight_two
    @board[@player_two.bishop_one.x][@player_two.bishop_one.y] = @player_two.bishop_one
    @board[@player_two.bishop_two.x][@player_two.bishop_two.y] = @player_two.bishop_two
    @board[@player_two.queen.x][@player_two.queen.y] = @player_two.queen
    @board[@player_two.king.x][@player_two.king.y] = @player_two.king
  end
end

class Chess
  def initialize
  puts "Please input player one's name and press enter, this player will play as white"
  player_one = gets.chomp
  puts "Please input player two's name and press enter, this player will play as black"
  player_two = gets.chomp
  puts "Thanks for playing #{player_one} and #{player_two}, have fun!"
  @game = Board.new(player_one, 'white', player_two, 'black')
  end
end

Chess.new



