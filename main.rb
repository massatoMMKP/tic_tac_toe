require_relative "lib/interface/menu"
require_relative "lib/game/game"
require_relative "lib/game/board"
require_relative "lib/game/player"
require_relative "lib/game/human_player"
require_relative "lib/game/computer_player"

loop do
  menu = Menu.new
  player1, player2 = menu.start

  game = Game.new(player1, player2)
  result = game.play

  break if result == :exit
end