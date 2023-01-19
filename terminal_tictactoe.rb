# frozen_string_literal: true

gameboard = [
  1, 2, 3,
  4, 5, 6,
  7, 8, 9
]

WINCOMBOS = {
  a: [0, 1, 2],
  b: [3, 4, 5],
  c: [6, 7, 8],
  d: [0, 4, 8],
  e: [2, 4, 6],
  f: [0, 3, 6],
  g: [1, 4, 7],
  h: [2, 5, 8]
}

# Create the players from a class
class Player
  def initialize(name)
    @name = name
  end

  board = []

  def display_name
    @name
  end

  def move(index)
    board.push(index)
  end

  def reset_board
    board.length = 0
  end
end

puts 'Player one will use an X and go first. Please enter a name for player one.'
player_one = Player.new(gets)
puts 'Player two will use an O and go second. Please enter a name for player two.'
player_two = Player.new(gets)

puts "
  #{gameboard[0]}|#{gameboard[1]}|#{gameboard[2]}
  -+-+-
  #{gameboard[3]}|#{gameboard[4]}|#{gameboard[5]}
  -+-+-
  #{gameboard[6]}|#{gameboard[7]}|#{gameboard[8]}\n
  1|2|3
  -+-+-
  4|5|6
  -+-+-
  7|8|9"
