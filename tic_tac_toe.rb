require_relative 'game.rb'
class Tic_Tac_Toe
  players = %w(X O)
  @starting_player = players[rand(2)]
  game = Game.new(@starting_player)
  game.play
end