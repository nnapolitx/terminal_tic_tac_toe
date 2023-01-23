# frozen_string_literal: true

gameboard = [
  ' ', ' ', ' ',
  ' ', ' ', ' ',
  ' ', ' ', ' '
]

WINCOMBOS = {
  a: [1, 2, 3],
  b: [4, 5, 6],
  c: [7, 8, 9],
  d: [1, 5, 9],
  e: [3, 5, 7],
  f: [1, 4, 7],
  g: [2, 5, 8],
  h: [3, 6, 9]
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

def winning_board(gameboard)
  puts "
  #{gameboard[0]}|#{gameboard[1]}|#{gameboard[2]}
  -+-+-
  #{gameboard[3]}|#{gameboard[4]}|#{gameboard[5]}
  -+-+-
  #{gameboard[6]}|#{gameboard[7]}|#{gameboard[8]}\n"
end

def current_turn(one, two)
  if one.board.length > two.board.length
    two
  else
    one
  end
end

def validate_player_move(current_move, current_player, gameboard, player_one, player_two)
  # check the move as valid and pass to player's board
  if player_one.board.include?(current_move) || player_two.board.include?(current_move)
    puts 'Space is already taken, please choose an EMPTY space'
    input_move(current_turn(player_one, player_two), gameboard, player_one, player_two)
  elsif current_move.positive? && current_move < 10
    current_player.move(current_move)
    gameboard[current_move - 1] = current_player.sym
  else
    puts "#{current_move} is not a valid move. Please enter a number 1 through 9 to choose an empty space"
  end
end

def announce_winner(current_player, gameboard)
  puts "#{current_player.name} is the winner, please play again!"
  winning_board(gameboard)
end

def check_winner(current_player, gameboard, player_one, player_two)
  # check for win or tie
  if current_player.board.length > 2
    WINCOMBOS.each_value do |arr|
      if (arr & current_player.board) == arr
        return announce_winner(current_player,gameboard)
      end
    end
  elsif player_one.board.length > 4
    puts 'There was a tie, please play again'
    winning_board(gameboard)
  else
    input_move(current_turn(player_one, player_two), gameboard, player_one, player_two)
  end
end

def input_move(current_player, gameboard, player_one, player_two)
  current_board(gameboard)
  puts "#{current_player.name}, please choose an open space."

  current_move = gets.chomp
  if current_move.match(/[a-zA-Z]/)
    puts "#{current_move} is not valid. Please enter a number 1-10"
    input_move(current_turn(player_one, player_two), gameboard, player_one, player_two)
  else
    current_move = current_move.to_i
    validate_player_move(current_move, current_player, gameboard, player_one, player_two)
    check_winner(current_player, gameboard, player_one, player_two)
  end
end

input_move(current_turn(player_one, player_two), gameboard, player_one, player_two)

# TODO
# Account for error inputs such as letters or numbers >9||<0
# Call TIE if gameboard.filter([/\d/]).length>=9
# Add a check winner module
# add a Play Again
# Refactor and namespace to make it easier to call a new game
