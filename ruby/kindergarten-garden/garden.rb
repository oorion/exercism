class Garden
  PLANTS = {"V" => :violets, "C" => :clover, "R" => :radishes, "G" => :grass}
  STUDENTS = [
               :alice,
               :bob,
               :charlie,
               :david,
               :eve,
               :fred,
               :ginny,
               :harriet,
               :ileana,
               :joseph,
               :kincaid,
               :larry
             ]

  attr_reader :students

  def initialize(rows, students=STUDENTS)
    @rows = rows
    @students = students.map(&:downcase).sort
    create_methods
  end

  def create_methods
    students.each_with_index do |action, index|
      self.class.send(:define_method, action) do
        split_rows = @rows.split("\n")
        converted_rows = split_rows.map {|row| row.split("").map {|plant| PLANTS[plant] }}
        person_index = index * 2
        [
         converted_rows[0][person_index],
         converted_rows[0][person_index + 1],
         converted_rows[1][person_index],
         converted_rows[1][person_index + 1]
        ]
      end
    end
  end
end
