class Series
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def digits
    numbers.chars.map(&:to_i)
  end

  def slices(slice_number)
    raise ArgumentError if slice_number > digits.length
    output = []
    digits.each_with_index do |n, i|
      limit = i + slice_number - 1
      unless limit >= digits.length
        output.push(digits[i..limit])
      end
    end
    output
  end

  def largest_product(product_number)
    max_product = slices(product_number).map do |e|
      e.reduce(&:*)
    end.max
    max_product ? max_product : 1
  end
end
