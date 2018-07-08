# Step 1 - break the credit card into it's individual digits.
# Step 2 - Start from the right, double every second digit (i.e digit 2, 4, 6 etc.).
# Step 3 - If the doubled value is greater than or equal to 10, take the value and subtract 9 from it.
# Step 4 - Sum the digits.
# Step 5 - If the sum is divisible by 10 it's a valid number. Otherwise it's invalid.

module Luhn
  def self.is_valid?(number)
    num_array = number.to_s.split(//).map { |num| num.to_i }.reverse

    doubled = num_array.map.with_index do |num, index|
      if index.odd?
        if num * 2 >= 10
          (num * 2) - 9
        else 
          num * 2
        end
      else
        num
      end    
    end

    total = 0
    while !doubled.empty?
      new_total = doubled.shift + total
      total = new_total
    end
    (total % 10).zero?
  end
end

def doubled
  number = 4194560385008504
  num_array = number.to_s.split(//).map { |num| num.to_i }.reverse
  num_array.map.with_index do |num, index|
    if index % 2 == 1
      if num * 2 >= 10
        (num * 2) - 9
      else 
        num * 2
      end
    else
      num
    end
  end
end

def sum(array)
  total = 0
  while array.size > 0
    new_total = array.shift + total
    total = new_total
  end
  return total
end