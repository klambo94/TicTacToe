require_relative 'board.rb'
class Game
  PLAYERS = %w{X O}
  @player
  @board
  def initialize(starting_player)
    if starting_player.to_s.empty?
      @player = 'O'
    else
      @player = starting_player
    end
  end

  def play
    puts 'Starting Tic-Tac-Toe'
    @board = Board.new(@player)
    @board.display
    until @board.board_full || @board.winner
      ask_player_for_move
      @board.display
      unless @board.board_full || @board.winner
        next_player
      end
    end
    if @board.winner
      print "Player #{@player} wins"
    elsif @board.board_full
      print 'Tie game.'
    end

    print 'Game over.'
  end

  def ask_player_for_move
    played = false
    until played
      puts "Player #{@player}: Where would you like to play?"
      move = gets.to_i - 1
      col = move % @board.size
      row = (move - col) / @board.size

      if @board.validate_position(row, col)
        @board.fill_position(row, col, @player);
        played = true
      end
    end

  end

  def next_player
   if !@board.board_full
     current_player = @player
     puts "Current Player = #{current_player}"
     if current_player == 'X'
       @player = 'O'
     else
       @player = 'X'
     end
   end
  end
end