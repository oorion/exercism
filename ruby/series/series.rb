class Series
  attr_reader :number, :split_number

  def initialize(number)
    @number = number
    @split_number = convert_number
  end

  def slices(slice_number)
    raise ArgumentError if slice_number > number.length
    output = []
    split_number.each_with_index do |n, i|
      unless i + slice_number - 1 >= number.length
        ending_index = i + slice_number - 1
        output.push(split_number[i..ending_index])
      end
    end
    output
  end

  def convert_number
    number.split("").map(&:to_i)
  end
end
