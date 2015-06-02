class Fixnum
  ROMANS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def to_roman
    output = ""
    remainder = self
    sorted_romans_keys.each_with_index do |n, i|
      first_key_offset = get_next_key(sorted_romans_keys, i)
      second_key_offset = get_next_key(sorted_romans_keys, i + 1)
      if remainder >= n
        times_to_add = remainder / n
        output += ROMANS[n] * times_to_add
        remainder -= n * times_to_add
      elsif first_key_offset && remainder + first_key_offset >= n && !starts_with_5?(first_key_offset)
        output += ROMANS[first_key_offset] + ROMANS[n]
        remainder = remainder - (n - first_key_offset)
      elsif second_key_offset && remainder + second_key_offset >= n && !starts_with_5?(second_key_offset)
        output += ROMANS[second_key_offset] + ROMANS[n]
        remainder = remainder - (n - second_key_offset)
      end
      break if remainder == 0
    end
    output
  end

  private

  def get_next_key(keys, i)
    keys[i + 1] if i + 1 != keys.length
  end

  def sorted_romans_keys
    ROMANS.keys.sort.reverse
  end

  def starts_with_5?(num)
    num.to_s[0] == '5'
  end
end
