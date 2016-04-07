def to_currency(str_number)
  str_number = str_number.to_f.round(2).to_s.split('.')

  cents = str_number[1]
  dollars = str_number[0]

  cents.length < 2 ? cents << '0' : cents
  dollars = dollars.split('').reverse.each_slice(3).map{|num| num.join}.join(',').reverse

  currency = "$#{dollars}.#{cents}"
  currency
end

p to_currency("100000")       # => "$100,000.00"
p to_currency("3456789879.1") # => "$3,456,789,879.10"
p to_currency("12343.43")     # => "$12,343.43"
p to_currency("12343.100")    # => "$12,343.10"
p to_currency("12343.996")    # => "$12,344.00"
