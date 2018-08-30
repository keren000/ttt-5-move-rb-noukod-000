def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  index = user_input.to_i - 1
  return index
end

def move(board, index, value)
  board[index] = value
  return board
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  else board[index] == " " || board[index] == "" || board[index] == nil
    return false
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 10)
    return true
  else
    return false
  end
end

def turn_count(board)
  turns_taken = 0
  board.each_with_index do |x, index|
    if position_taken?(board, index)
      turns_taken += 1
    end
  end
  return turns_taken
end

def current_player(board)
  turn_tally = turn_count(board)

  if turn_tally % 2 == 0
    puts "It is now X's turn"
    return "X"
  else
    puts "It is now O's turn"
    return "O"
  end
end
