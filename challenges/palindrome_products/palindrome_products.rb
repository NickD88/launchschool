# NOT FINISHED


class Palindromes
  attr_reader :max, :min

  def initialize(factors)
    @max = factors[:max_factor]
    @min = factors[:min_factor] || 1
    @palindrome = []
  end

  def generate
    all_numbers = (@min..@max).to_a
    all_numbers.repeated_combination(2).to_a.each do |set|
      product = set.reduce(:*)
      @palindrome << product if palindrome?(product)
    end
    @palindrome
  end

  def palindrome?(number)
    number == number.to_s.reverse.to_i
  end

  def largest
    @palindrome.max
  end

end
