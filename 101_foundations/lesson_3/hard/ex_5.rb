def is_a_number?(num)
  num.to_f > 0
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end
  true
end

p dot_separated_ip_address?("192.168.1")
p dot_separated_ip_address?("192.168.1.1")
p dot_separated_ip_address?("192.to.1.1")
