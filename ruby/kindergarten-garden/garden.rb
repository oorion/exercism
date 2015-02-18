class Garden
  attr_reader :converted_diagram, :students  # => nil

  PLANTS = {'R' => :radishes, 'C' => :clover, 'G' => :grass, 'V' => :violets}  # => {"R"=>:radishes, "C"=>:clover, "G"=>:grass, "V"=>:violets}

  def initialize(diagram, students=[])
    @converted_diagram = convert_diagram(diagram)  # => [[:violets, :clover], [:radishes, :clover]]
    @students = students                           # => []
  end

  def convert_diagram(diagram)
    diagram.split("\n").map do |plant_row|  # => ["VC", "RC"]
      plant_row.chars.map do |plant|        # => ["V", "C"], ["R", "C"]
        PLANTS[plant]                       # => :violets, :clover, :radishes, :clover
      end                                   # => [:violets, :clover], [:radishes, :clover]
    end                                     # => [[:violets, :clover], [:radishes, :clover]]
  end

  def alice
    [converted_diagram[0][0], converted_diagram[0][1], converted_diagram[1][0], converted_diagram[1][1]]
  end

  def bob

  end
end

garden = Garden.new("VC\nRC")  # => #<Garden:0x007fdf8a022418 @converted_diagram=[[:violets, :clover], [:radishes, :clover]], @students=[]>
garden.converted_diagram       # => [[:violets, :clover], [:radishes, :clover]]
