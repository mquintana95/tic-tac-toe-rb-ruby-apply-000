WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ].freeze
board = [" ", " ", " ", " ", " ", " ", " ", " ", " " ]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, position, char)
  board[position] = char
end

def position_taken?(board,index)
  board[index] == 'X' || board[index] == 'O'
end  

def valid_move?(board,index)
  !position_taken?(board,index) && index.between?(0,8)
end

def turn(board)
  puts "Please enter 1-9:"
  input=gets.strip
  index=input_to_index(input)
    if valid_move?(board,index)
      move(board, index, current_player(board))
    else
      turn(board)
  end
     display_board(board)
end

def turn_count(board)
  board.count do |element|
    element == "X" || element == "O"
  end
end

def current_player(board)
  if turn_count(board).even? 
    return 'X'
  else
    return 'O'
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do|combo| 
  board[combo[0]] == board[combo[1]] && 
  board[combo[1]] == board[combo[2]] &&
  position_taken?(board, combo[0])
  end
end

def full?(board)
  !board.any? { |x| x == " " }
end
  
def draw?(board)
  !won?(board) && full?(board)
end 

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if combo = won?(board)
    winning_index = combo[0]
  return board[winning_index]
  end
end
  
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
 end





