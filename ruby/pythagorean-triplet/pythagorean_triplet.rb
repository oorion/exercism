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
    unless sum
      (min_factor..max_factor).to_a.combination(3).select do |a, b, c|
        new(a, b, c).pythagorean?
      end.map do |e|
        Triplet.new(*e)
      end
    else
      (min_factor..max_factor).to_a.combination(3).select do |a, b, c|
        new(a, b, c).pythagorean? && new(a, b, c).sum == sum
      end.map do |e|
        Triplet.new(*e)
      end
    end
  end
end
