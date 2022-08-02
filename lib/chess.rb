

class Board

  def initialize(player_one_name = 'Johnny', player_two_name = 'Bob')
    @player_one_name = player_one_name
    @player_two_name = player_two_name
    @player_one = Player.new(player_one_name)
    @player_two = Player.new(player_two_name)
  end
end
