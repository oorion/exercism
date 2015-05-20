class Triplet
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def sum
    x + y + z
  end

  def product
    x * y * z
  end

  def pythagorean?
    x**2 + y**2 == z**2
  end

  def self.where(min_factor: 1, max_factor: 1, sum: nil)
    num_range = (min_factor..max_factor)
    unless sum
      find_pythagorean_triplets(num_range) do |a, b, c|
        new(a, b, c).pythagorean?
      end
    else
      find_pythagorean_triplets(num_range) do |a, b, c|
        new(a, b, c).pythagorean? && new(a, b, c).sum == sum
      end
    end
  end

  private

  def self.find_pythagorean_triplets(range)
    range.to_a.combination(3).select do |a, b, c|
      yield(a, b, c)
    end.map do |e|
      Triplet.new(*e)
    end
  end
end
