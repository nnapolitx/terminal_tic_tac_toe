# frozen_string_literal: true

gameboard = [
  1, 2, 3,
  4, 5, 6,
  7, 8, 9
]

# Create the players from a class
class Player
  def initialize(name)
    @name = name
  end

  def display_name
    @name
  end

  gameboard = []
end

puts 'Player one will use an X and go first. Please enter a name for player one.'
player_one = Player.new(gets)
puts 'Player one will use an X and go first. Please enter a name for player two.'
player_two = Player.new(gets)
