class WordProblem

  OPERATORS = {
    "plus" => "+",
    "minus" => "-",
    "multiplied" => "*",
    "divided" => "/"
  }

  def initialize(word_problem)
    @word_problem = word_problem.gsub(/(What is |by )/, '').delete('?')

    raise ArgumentError if !@word_problem.match(/plus|minus|multiplied|divided/)
  end

  def answer
    problem = @word_problem.split(' ')
    sum = problem.shift.to_i
    until problem.empty?
      sum = sum.send(OPERATORS[problem.shift], problem.shift.to_i)
    end
    sum
  end
end
