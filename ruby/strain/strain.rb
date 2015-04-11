class Array
  def keep
    each_with_object([]) { |element, kept| kept << element if yield element }
  end

  def discard
    map do |element|
      element unless yield element
    end.compact
  end
end
