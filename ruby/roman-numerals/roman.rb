class Fixnum
  ROMANS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L'
  }

  def to_roman
    output = ""
    remainder = self
    ROMANS.keys.sort.reverse.each do |n|
      if remainder + 1 == n && remainder != 0
        output += 'I' + ROMANS[n]
        remainder -= n
      elsif remainder >= n
        times_to_add = remainder / n
        output += ROMANS[n] * times_to_add
        remainder -= n * times_to_add
      end
    end
    output
  end
end
