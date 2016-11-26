class Board
  BOARD_MAX_INDEX = 2
  EMPTY_POS = ' '

  def initialize(starting_player)
    @current_player = starting_player
    @board = Array.new(BOARD_MAX_INDEX + 1) {
      Array.new(BOARD_MAX_INDEX + 1) {EMPTY_POS}
    }

  end

  def size
    return @board.size
  end

  def display
    puts '+- - - - - -+'
    (0..BOARD_MAX_INDEX).each do |row|
      print '| '
      (0..BOARD_MAX_INDEX).each do |col|
        s = @board[row][col]
        if s == EMPTY_POS
          print col + (row* 3) + 1
        else
          print s
        end
        print ' | '
      end
      puts "\n+- - - - - -+"
    end
  end

  def board_full
    (0..BOARD_MAX_INDEX).each do |row|
      (0..BOARD_MAX_INDEX).each do |col|
        if@board[row][col] == EMPTY_POS
          return false
        end
      end
    end
  end

  def winner
    if winner_cols
      return winner_cols
    elsif winner_rows
      return winner_rows
    elsif winner_cols
      return winner_diagonals
    end
    false
  end

  def winner_cols
    (0..BOARD_MAX_INDEX).each{|col_ind|
      symbol = @board[0][col_ind]
      next if symbol == EMPTY_POS
      (0..BOARD_MAX_INDEX).each{|row_ind|
      if symbol != @board[row_ind][col_ind]
        break
      elsif row_ind == BOARD_MAX_INDEX
        return symbol
      end
      }
    }
      false
  end

  def winner_rows
   (0..BOARD_MAX_INDEX).each{|row_ind|
     symbol = @board[row_ind][0]
     next if symbol == EMPTY_POS
     (0..BOARD_MAX_INDEX).each{|col_ind|
       if symbol != @board[row_ind][col_ind]
         break
       elsif col_ind ==BOARD_MAX_INDEX
         return symbol
       end
     }
   }
    false
  end

  def winner_diagonals
    symbol = @board[0][0]
    unless symbol == EMPTY_POS
      (1..BOARD_MAX_INDEX).each{|index|
        if symbol != @board[index][index]
          break
        elsif index == BOARD_MAX_INDEX
          return symbol
        end
      }
    end

    symbol = @board[0][BOARD_MAX_INDEX]
    unless symbol == EMPTY_POS
    (0..BOARD_MAX_INDEX).zip(BOARD_MAX_INDEX.downto(0)) do |row, col|
      if symbol != @board[row][col]
        break
      elsif row == BOARD_MAX_INDEX
        return symbol
      end
    end
    end
    false
  end

  def validate_position(row, col)
    if row.to_i < @board.size && col.to_i < @board.size
      if @board[row.to_i][col.to_i] == EMPTY_POS
        return true
      else
        puts 'Position occupied!'
      end
    else
      puts 'Invalid position!'
    end
    false
  end

  def fill_position(row, col, player)
    if validate_position(row, col)
      @board[row.to_i][col.to_i] = player
    end
  end
end