class SecretHandshake
  attr_reader :number

  SECRETS = {
             1 => 'wink',
             2 => 'double blink',
             4 => 'close your eyes',
             8 => 'jump',
             16 => 'reverse'
            }

  def initialize(number)
    @number = number
  end

  def commands
    return [] if number.class != Fixnum
    reversed_secrets = reverse_secrets(convert_number_to_secrets)
    remove_reverse_from_list(reversed_secrets)
  end

  private

  def secrets_keys
    SECRETS.keys.sort.reverse
  end

  def convert_number_to_secrets
    temp = number
    output = []
    until temp == 0
      secrets_keys.each do |key|
        if temp - key >= 0
          output.push(SECRETS[key])
          temp -= key
          break
        end
      end
    end
    output.reverse
  end

  def reverse_count(list)
    list.count do |e|
      e == 'reverse'
    end
  end

  def reverse_secrets(list)
    count = reverse_count(list)
    until count == 0
      list = list.reverse
      count -= 1
    end
    list
  end

  def remove_reverse_from_list(list)
    list.reject do |e|
      e == 'reverse'
    end
  end
end
