class Fixnum
  ROMANS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L'
  }
  def to_roman
    x = self.divmod(5)
    y = x[1].divmod(1)
    y[0] * I
  end


end
