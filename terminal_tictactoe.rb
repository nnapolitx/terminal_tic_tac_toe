# frozen_string_literal: true

gameboard = [
  ' ', ' ', ' ',
  ' ', ' ', ' ',
  ' ', ' ', ' '
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
  attr_reader :board, :name, :sym

  def initialize(name, sym)
    @name = name
    @sym = sym
    @board = []
  end

  def board_len
    @board.length
  end

  def display_name
    @name
  end

  def move(index)
    @board.push(index)
  end

  def reset_board
    @board.length = 0
  end
end

puts 'Player one will use an X and go first. Please enter a name for player one.'
player_one = Player.new(gets.chomp, 'X')
puts 'Player two will use an O and go second. Please enter a name for player two.'
player_two = Player.new(gets.chomp, 'O')

def current_board(gameboard)
  puts " CURRENT BOARD
  #{gameboard[0]}|#{gameboard[1]}|#{gameboard[2]}
  -+-+-
  #{gameboard[3]}|#{gameboard[4]}|#{gameboard[5]}
  -+-+-
  #{gameboard[6]}|#{gameboard[7]}|#{gameboard[8]}\n

  CHOOSE A SPACE
  1|2|3
  -+-+-
  4|5|6
  -+-+-
  7|8|9"
end

def current_turn(one, two)
  if one.board.length > two.board.length
    two
  else
    one
  end
end

def input_move(current_player, gameboard, player_one, player_two)
  current_board(gameboard)
  puts "#{current_player.name}, please choose an open space."

  current_move = gets.chomp.to_i
  if current_player.board.include?(current_move)
    puts 'Space is already taken, please choose an EMPTY space'
    input_move
  else
    current_player.move(current_move)
    gameboard[current_move-1] = current_player.sym
  end
  input_move(current_turn(player_one, player_two), gameboard, player_one, player_two)
end

input_move(current_turn(player_one, player_two), gameboard, player_one, player_two)
