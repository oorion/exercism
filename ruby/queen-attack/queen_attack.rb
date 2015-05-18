class Queens
  attr_reader :white, :black, :board

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
    @board = create_board(white, black)
  end

  def to_s
    board.map {|row| row.chars.join(" ")}.join("\n")
  end

  def attack?
    vertical_attack? || horizontal_attack? || diagonal_attack?
  end

  private

  def create_board(white, black)
    new_board = create_empty_board
    new_board[white[0]][white[1]] = "W"
    new_board[black[0]][black[1]] = "B"
    new_board
  end

  def create_empty_board
    board = []
    8.times do
      board.push("_" * 8)
    end
    board
  end

  def vertical_attack?
    white[0] == black[0]
  end

  def horizontal_attack?
    white[1] == black[1]
  end

  def diagonal_attack?
    return true if right_diagonal_attack?
    return true if left_diagonal_attack?
  end

  def right_diagonal_attack?
    test_position = white
    while test_position[0] <= 8 || test_position[1] <= 8 do
      return true if test_position == black
      test_position = test_position.map { |e| e + 1 }
    end
  end

  def left_diagonal_attack?
    test_position = white
    while test_position[0] >= 0 || test_position[1] <= 8 do
      return true if test_position == black
      test_position = [test_position[0] - 1, test_position[1] + 1]
    end
  end
end
