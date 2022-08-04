class Piece
  attr_reader :piece, :color
  attr_accessor :x, :y, :moveset

  def initialize(piece, x, y, color)
    @color = color
    @piece = piece
    @x = x
    @y = y
    @moveset = []
  end
end

class King < Piece
  attr_accessor :moved, :check, :checkmate
  def initialize(piece, x, y, color)
    super
    @moved = false
    @check = false
    @checkmate = false
  end

  def forward(board, x, y)
    @color == 'white' ? x + 1 : x - 1
    if @color == 'white'
      return if x > 7
    elsif x < 0
      return
    end
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def backward(board, x, y)
    @color == 'white' ? x - 1 : x + 1
    if @color == 'white'
      return unless x >= 0
    else
      return unless x <= 7
    end
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def right(board, x, y)
    @color == 'white' ? y + 1 : y - 1
    if @color == 'white'
      return unless y <= 7
    else
      return unless y >= 0
    end
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def left(board, x, y)
    @color == 'white' ? y - 1 : y + 1
    if @color == 'white'
      return unless y >= 0
    else
      return unless y <= 7
    end
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def down_right(board, x, y)
    @color == 'white' ? x - 1 && y + 1 : x + 1 && y - 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def down_left(board, x, y)
    @color == 'white' ? x - 1 && y - 1 : x + 1 && y + 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def up_right(board, x, y)
    @color == 'white' ? x + 1 && y + 1 : x - 1 && y - 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def up_left(board, x, y)
    @color == 'white' ? x + 1 && y - 1 : x - 1 && y + 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def possible_moves(board, x, y)
    forward(board, x, y)
    backward(board, x, y)
    right(board, x, y)
    left(board, x, y)
    down_right(board, x, y)
    down_left(board, x, y)
    up_right(board, x, y)
    up_left(board, x, y)
  end

  def choose_move(x, y)
    if @moveset.bsearch { |i| i == [x, y] } == true
      puts "You have moved #{piece} from #{[@x, @y]}to #{[x, y]}"
      @x = x
      @y = y
      @moved = true
      clear_moveset
    else
      false
    end
  end

  def clear_moveset
    @moveset = []
  end
end

class Queen < Piece
  def initialize(piece, x, y, color)
    super
  end

  def forward(board, x, y)
    @color == 'white' ? x + 1 : x - 1
    if @color == 'white'
      return unless x <= 7
    else
      return unless x >= 0
    end
    if board[x][y].nil?
      @moveset << [x, y]
      forward(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def backward(board, x, y)
    @color == 'white' ? x - 1 : x + 1
    if @color == 'white'
      return unless x >= 0
    else
      return unless x <= 7
    end
    if board[x][y].nil?
      @moveset << [x, y]
      backward(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def right(board, x, y)
    @color == 'white' ? y + 1 : y - 1
    if @color == 'white'
      return unless y <= 7
    else
      return unless y >= 0
    end
    if board[x][y].nil?
      @moveset << [x, y]
      right(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def left(board, x, y)
    @color == 'white' ? y - 1 : y + 1
    if @color == 'white'
      return unless y >= 0
    else
      return unless y <= 7
    end
    if board[x][y].nil?
      @moveset << [x, y]
      left(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def down_right(board, x, y)
    @color == 'white' ? x - 1 && y + 1 : x + 1 && y - 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    if board[x][y].nil?
      @moveset << [x, y]
      down_right(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def down_left(board, x, y)
    @color == 'white' ? x - 1 && y - 1 : x + 1 && y + 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    if board[x][y].nil?
      @moveset << [x, y]
      down_left(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def up_right(board, x, y)
    @color == 'white' ? x + 1 && y + 1 : x - 1 && y - 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    if board[x][y].nil?
      @moveset << [x, y]
      up_right(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def up_left(board, x, y)
    @color == 'white' ? x + 1 && y - 1 : x - 1 && y + 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    if board[x][y].nil?
      @moveset << [x, y]
      up_left(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def possible_moves(board, x, y)
    forward(board, x, y)
    backward(board, x, y)
    right(board, x, y)
    left(board, x, y)
    down_right(board, x, y)
    down_left(board, x, y)
    up_right(board, x, y)
    up_left(board, x, y)
  end

  def choose_move(x, y)
    if @moveset.bsearch { |i| i == [x, y] } == true
      puts "You have moved #{piece} from #{[@x, @y]}to #{[x, y]}"
      @x = x
      @y = y
      clear_moveset
    else
      false
    end
  end

  def clear_moveset
    @moveset = []
  end
end

class Bishop < Piece
  def initialize(piece, x, y, color)
    super
  end

  def right_diagonal(board, x, y)
    @color == 'white' ? x + 1 && y + 1 : x - 1 && y - 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    if board[x][y].nil?
      @moveset << [x, y]
      right_diagonal(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def left_diagonal(board, x, y)
    @color == 'white' ? x + 1 && y - 1 : x - 1 && y + 1
    return if x > 7 || x < 0 || y > 7 || y < 0

    if board[x][y].nil?
      @moveset << [x, y]
      left_diagonal(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def possible_moves(board, x, y)
    right_diagonal(board, x, y)
    left_diagonal(board, x, y)
  end

  def choose_move(x, y)
    if @moveset.bsearch { |i| i == [x, y] } == true
      puts "You have moved #{piece} from #{[@x, @y]}to #{[x, y]}"
      @x = x
      @y = y
      clear_moveset
    else
      false
    end
  end

  def clear_moveset
    @moveset = []
  end
end

class Knight < Piece
  def initialize(piece, x, y, color)
    super
  end

  def up_right(board, x, y)
    if @color == 'white'
      return unless x <= 5 && y <= 6
    else
      return unless x >= 2 && y >= 1
    end
    @color == 'white' ? x + 2 && y + 1 : x - 2 && y - 1
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def up_left(board, x, y)
    if @color == 'white'
      return unless x <= 5 && y >= 1
    else
      return unless x >= 2 && y <= 6
    end
    @color == 'white' ? x + 2 && y - 1 : x - 2 && y + 1
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def right_up(board, x, y)
    if @color == 'white'
      return unless x <= 6 && y <= 5
    else
      return unless x >= 1 && y >= 2
    end
    @color == 'white' ? x + 1 && y + 2 : x - 1 && y - 2
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def left_up(board, x, y)
    if @color == 'white'
      return unless x <= 6 && y >= 2
    else
      return unless x >= 1 && y <= 5
    end
    @color == 'white' ? x + 1 && y - 2 : x - 1 && y + 2
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def down_right(board, x, y)
    if @color == 'white'
      return unless x >= 2 && y <= 6
    else
      return unless x <= 5 && y >= 1
    end
    @color == 'white' ? x - 2 && y + 1 : x + 2 && y - 1
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def down_left(board, x, y)
    if @color == 'white'
      return unless x >= 2 && y >= 1
    else
      return unless x <= 5 && y <= 6
    end
    @color == 'white' ? x - 2 && y - 1 : x + 2 && y + 1
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def right_down(board, x, y)
    if @color == 'white'
      return unless x >= 1 && y <= 5
    else
      return unless x <= 6 && y >= 2
    end
    @color == 'white' ? x - 1 && y + 2 : x + 1 && y - 2
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def left_down(board, x, y)
    if @color == 'white'
      return unless x >= 1 && y >= 2
    else
      return unless x <= 6 && y <= 5
    end
    @color == 'white' ? x - 1 && y - 2 : x + 1 && y + 2
    @moveset << [x, y] if board[x][y].nil? || !board[x][y].nil? && board[x][y].color != @color
  end

  def possible_moves(board, x, y)
    up_right(board, x, y)
    up_left(board, x, y)
    right_up(board, x, y)
    left_up(board, x, y)
    down_right(board, x, y)
    down_left(board, x, y)
    right_down(board, x, y)
    left_down(board, x, y)
  end

  def choose_move(x, y)
    if @moveset.bsearch { |i| i == [x, y] } == true
      puts "You have moved #{piece} from #{[@x, @y]}to #{[x, y]}"
      @x = x
      @y = y
      clear_moveset
    else
      false
    end
  end

  def clear_moveset
    @moveset = []
  end
end

class Rook < Piece
  attr_accessor :moved
  def initialize(piece, x, y, color)
    super
    @moved = false
  end

  def move_right(board, x, y)
    @color == 'white' ? y + 1 : y - 1
    if @color == 'white'
      return unless y <= 7
    else
      return unless y >= 0
    end
    if board[x][y].nil?
      @moveset << [x, y]
      move_right(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def move_left(board, x, y)
    @color == 'white' ? y - 1 : y + 1
    if @color == 'white'
      return unless y >= 0
    else
      return unless y <= 7
    end
    if board[x][y].nil?
      @moveset << [x, y]
      move_left(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def move_forward(board, x, y)
    @color == 'white' ? x + 1 : x - 1
    if @color == 'white'
      return unless x <= 7
    else
      return unless x >= 0
    end
    if board[x][y].nil?
      @moveset << [x, y]
      move_forward(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def move_backward(board, x, y)
    @color == 'white' ? x - 1 : x + 1
    if @color == 'white'
      return unless x >= 0
    else
      return unless x <= 7
    end
    if board[x][y].nil?
      @moveset << [x, y]
      move_backward(board, x, y)
    elsif !board[x][y].nil? && board[x][y].color != @color
      @moveset << [x, y]
      nil
    end
  end

  def possible_moves(board, x, y)
    move_right(board, x, y)
    move_left(board, x, y)
    move_forward(board, x, y)
    move_backward(board, x, y)
  end

  def choose_move(x, y)
    if @moveset.bsearch { |i| i == [x, y] } == true
      puts "You have moved #{piece} from #{[@x, @y]}to #{[x, y]}"
      @moved = true
      @x = x
      @y = y
      clear_moveset
    else
      false
    end
  end

  def clear_moveset
    @moveset = []
  end
end

class Pawn < Piece
  attr_accessor :moved, :double_moved
  def initialize(piece, x, y, color)
    super
    @moved = false
    @double_moved = false
  end

  def single_move(board, x, y)
    @color == 'white' ? x + 1 : x - 1
    if @color == 'white'
      return unless x <= 7
    else
      return unless x >= 0
    end
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
    @color == 'white' ? x + 1 && y - 1 : x - 1 && y + 1
    return unless !board[x][y].nil? && board[x][y].color != @color

    @moveset << [x, y]
  end

  def en_passant_right(board, x, y)
    @color == 'white' ? y + 1 : y - 1
    return unless board[x][y].instance_of?(Pawn) && board[x][y].color != @color && board[x][y].double_moved == true

    @color == 'white' ? x + 1 : x - 1
    @moveset << [x, y]
  end

  def en_passant_left(board, x, y)
    @color == 'white' ? y - 1 : y + 1
    return unless board[x][y].instance_of?(Pawn) && board[x][y].color != @color && board[x][y].double_moved == true

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

  def choose_move(x, y)
    if @moveset.bsearch { |i| i == [x, y] } == true
      puts "You have moved #{piece} from #{[@x, @y]}to #{[x, y]}"
      @double_moved = if @color == 'white' && @x + 2 == x
                        true
                      elsif @color == 'black' && @x - 2 == x
                        true
                      else
                        false
                      end
      @moved = true
      @x = x
      @y = y
      clear_moveset
    else
      false
    end
  end

  def clear_moveset
    @moveset = []
  end
end

class Player
  attr_reader :pawn_one, :pawn_two, :pawn_three, :pawn_four, :pawn_five, :pawn_six, :pawn_seven, :pawn_eight,
              :rook_one, :rook_two, :knight_one, :knight_two, :bishop_one, :bishop_two, :queen, :king, :pieces
  attr_accessor :board

  def initialize(name, color)
    @name = name
    @color = color.downcase
    @color == 'white' ? initialize_white_pieces : initialize_black_pieces
    @pieces = [@pawn_one, @pawn_two, @pawn_three, @pawn_four, @pawn_five, @pawn_six, @pawn_seven, @pawn_eight, @rook_one, @rook_two, @knight_one, @knight_two, @bishop_one, @bishop_two, @queen, @king]
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
    @rook_one = Rook.new('♖', 0, 0, 'white')
    @rook_two = Rook.new('♖', 0, 7, 'white')
    @knight_one = Knight.new('♘', 0, 1, 'white')
    @knight_two = Knight.new('♘', 0, 6, 'white')
    @bishop_one = Bishop.new('♗', 0, 2, 'white')
    @bishop_two = Bishop.new('♗', 0, 5, 'white')
    @queen = Queen.new('♕', 0, 3, 'white')
    @king = King.new('♔', 0, 4, 'white')
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
    @rook_one = Rook.new('♜', 7, 0, 'black')
    @rook_two = Rook.new('♜', 7, 7, 'black')
    @knight_one = Knight.new('♞', 7, 1, 'black')
    @knight_two = Knight.new('♞', 7, 6, 'black')
    @bishop_one = Bishop.new('♝', 7, 2, 'black')
    @bishop_two = Bishop.new('♝', 7, 5, 'black')
    @queen = Queen.new('♛', 7, 3, 'black')
    @king = King.new('♛', 7, 4, 'black')
  end

  def select_piece(board)
    puts "It's your turn #{@name}, please input the x coordinate (1 - 8) of the piece you would like to move and press enter"
    x = gets.to_i 
    puts "You have selected the x coordinate ##{x}, next input the y coordinate (1 - 8) and press enter"
    y = gets.to_i
      puts "You have selected the y coordinate ##{y}"
      if x > 0 && y > 0 && x <= 8 && y <= 8
        x -= 1
        y -= 1
        select_move(board, x, y)
      else
        puts "#{[x, y]} is an invalid coordinate, please try again"
        select_piece(board)
      end
  end

  def select_move(board, x, y)
    if !board[x][y].nil? && board[x][y].color == @color
      piece = board[x][y]
      puts "You have selected #{board[x][y].piece} #{@name}, please input the x coordinate (1 - 8) and press enter."
      x = gets.to_i
      puts "You have selected the x coordinate ##{x}, next input the y coordinate and press enter"
      y = gets.to_i
      puts "You have selected the y coordinate ##{y}"
        if x > 0 && y > 0 && x <= 8 && y <= 8
          x -= 1
          y -= 1  
          move_piece(board, x, y, piece)
        else
          puts "#{[x, y]} is an invalid coordinate, please try again"
          select_move(board, piece.x, piece.y)
        end
    else
      puts "You do not control a piece at position #{[x + 1, y + 1]}, please select a position with a piece you control"
      select_piece(board)
    end
  end

  def move_piece(board, x, y, piece)
    piece.possible_moves(board, piece.x, piece.y)
    if piece.choose_move(x, y) == true
      if  !board[x][y].nil? && board[x][y].color != @color
        puts "You have captured the opponent's #{board[x][y].piece}"
        board[x][y].x = nil
        board[x][y].y = nil
        board[x][y] = piece
      else
        board[x][y] = piece
      end
    else
      puts "That is an invalid move for #{piece.piece}, please select again"
      select_move(board, piece.x, piece.y)
    end
    @board = board
  end
end

class Board
  attr_accessor :board
  attr_reader :player_one, :player_two

  def initialize(board = Array.new(8) do
                           Array.new(8)
                         end, player_one_name, player_one_color, player_two_name, player_two_color)
    @board = board
    @player_one = Player.new(player_one_name, player_one_color)
    @player_two = Player.new(player_two_name, player_two_color)
    set_board
  end

  def set_board
    set_player_one_pieces
    set_player_two_pieces
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
    play
  end

  def play
    loop do
      p @game.board
      @game.player_one.select_piece(@game.board)
      @game.set_board
      p @game.board
      @game.player_two.selec_piece(@game.board)
      @game.set_board
    end
  end


end

Chess.new
