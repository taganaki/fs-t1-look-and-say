# Calculates the Look and Say sequence
class LookAndSay
  # computes a sequence up to a given length
  def create_sequence(sequence_length)
    return [] unless sequence_length.positive?

    item = '1' # first item
    arr = [item]

    (1...sequence_length).each do # we calculate the required number of elements
      item = count_next_item(item)
      arr << item
    end

    arr
  end

  # calculates the next one based on the current element
  def count_next_item(current_item)
    count = 1
    result = ''

    (0...current_item.length).each do |i|
      if i == (current_item.length - 1) || current_item[i] != current_item[i + 1]
        result += count.to_s + current_item[i].to_s
        count = 1
      else
        count += 1
      end
    end

    result
  end
end
