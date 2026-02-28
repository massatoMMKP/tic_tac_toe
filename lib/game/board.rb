class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, nil) }
  end

  def place(position, symbol)
    row, col = position

    return false unless valid_move?(position)

    @grid[row][col] = symbol
    true
  end

  def valid_move?(position)
    row, col = position
    row.between?(0, 2) &&
      col.between?(0, 2) &&
      @grid[row][col].nil?
  end

  def available_positions
    positions = []

    @grid.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        positions << [i, j] if cell.nil?
      end
    end

    positions
  end

  def winner
    lines.each do |line|
      return line.first if line.uniq.size == 1 && !line.first.nil?
    end
    nil
  end

  def draw?
    return false if winner
    available_positions.empty?
  end

  def game_over?
    !winner.nil? || draw?
  end

  def display
    puts
    puts "    0   1   2"
    puts 

    @grid.each_with_index do |row, i|
      row_display = row.map { |cell| cell.nil? ? " " : cell }.join(" | ")
      puts "#{i}  #{row_display} "
      puts "  -----------"
    end

    puts
  end

  def deep_copy
    copy = Board.new

    @grid.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        copy.place([i, j], cell) unless cell.nil?
      end
    end

    copy
  end

  private
  def lines
    rows = @grid
    columns = @grid.transpose
    diagonals = [
      [@grid[0][0], @grid[1][1], @grid[2][2]],
      [@grid[0][2], @grid[1][1], @grid[2][0]]
    ]

    rows + columns + diagonals
  end

end
