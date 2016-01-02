class CircularBuffer
  DEFAULT_POSITION = 0

  def initialize(size)
    @size = size
    @buffer = Array.new(@size)
    @read_position = DEFAULT_POSITION
    @write_position = DEFAULT_POSITION
  end

  def read
    determine_if_buffer_is_empty
    data = @buffer[@read_position]
    @buffer[@read_position] = nil
    update_read_position
    data
  end

  def write(data)
    return if data == nil
    determine_if_buffer_is_full
    write_to_buffer(data)
    update_write_position
  end

  def write!(data)
    return if data == nil
    if @buffer[@write_position] == nil
      write(data)
    else
      write_to_buffer(data)
      update_write_position
      update_read_position
    end
  end

  def clear
    @buffer = @buffer.map { nil }
    @read_position = DEFAULT_POSITION
    @write_position = DEFAULT_POSITION
  end

  private

  def determine_if_buffer_is_empty
    raise BufferEmptyException if @buffer.compact.size == 0
  end

  def determine_if_buffer_is_full
    raise BufferFullException if @buffer[@write_position] != nil
  end

  def write_to_buffer(data)
    @buffer[@write_position] = data
  end

  def update_read_position
    @read_position = update_position(@read_position)
  end

  def update_write_position
    @write_position = update_position(@write_position)
  end

  def update_position(position)
    (position + 1) % @size
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end
