class Anagram
  attr_reader :initial_str, :sorted_str

  def initialize(string)
    @initial_str = string
    @sorted_str = sort(string)
  end

  def match(array)
    array.select { |word| anagram?(word) && different?(word) }
  end

  private

  def sort(string)
    string.downcase.chars.sort.join('')
  end

  def different?(string)
    initial_str.casecmp(string) != 0
  end

  def anagram?(test_str)
    sorted_str == sort(test_str)
  end
end
