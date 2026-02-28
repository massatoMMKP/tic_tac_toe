require_relative "board"

class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end
end