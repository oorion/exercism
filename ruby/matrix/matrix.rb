class Matrix
  attr_reader :text, :rows, :columns

  def initialize(input)
    @text = input
  end

  # def rows
  #   text.split("\n").map do |element|
  #     element.split.map do |item|
  #       item.to_i
  #     end
  #   end
  # end

  def rows
    text.split("\n").map do |element|
      mapped = element.split.map do |item|
        item.to_i
      end
      require 'pry'; binding.pry
    end
  end

  def columns
    rows.transpose
  end
end

matrix = Matrix.new("1 4 9\n16 25 36")
matrix.rows
matrix.columns
