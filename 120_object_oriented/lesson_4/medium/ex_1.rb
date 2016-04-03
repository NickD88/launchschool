class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# The code is valid and balance does not need the @ prefix because the attr_reader method is used.
# By using the attr_reader method a method called balance will return @balance.
# When balance is used in the positive_balance? method it is calling the balance method and not
# the instance variable directly.
