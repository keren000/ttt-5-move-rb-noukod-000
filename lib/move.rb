def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!


# Define won?, full?, draw?, over?, and winner below
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
  return index
end

def move(arr, index, val)
  arr[index] = val
  return arr
end

# def position_taken?(board, index)
#   !(board[index].nil? || board[index] == " ")
# end

def position_taken?(arr, index)
  if arr[index] == "X" || arr[index] == "O"
    return true
  else arr[index] == " " || arr[index] == "" || arr[index] == nil
    return false
  end
end

def valid_move?(arr, index)
  if !position_taken?(arr, index) && index.between?(0, 10)
    return true
  else
    return false
  end
end

def turn_count(arr)
  turns_taken = 0
  arr.each_with_index do |x, index|
    if position_taken?(arr, index)
      turns_taken += 1
    end
  end
  return turns_taken
end

def current_player(arr)
  turn_tally = turn_count(arr)

  if turn_tally % 2 == 0
    puts "It is now X's turn"
    return "X"
  else
    puts "It is now O's turn"
    return "O"
  end
end
