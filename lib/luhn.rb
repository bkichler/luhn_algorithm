# Step 1 - break the credit card into it's individual digits.
# Step 2 - Start from the right, double every second digit (i.e digit 2, 4, 6 etc.).
# Step 3 - If the doubled value is greater than or equal to 10, take the value and subtract 9 from it.
# Step 4 - Sum the digits.
# Step 5 - If the sum is divisible by 10 it's a valid number. Otherwise it's invalid.

module Luhn
  def self.is_valid?(number)
    # Split into string array, convert back to integers, reverse the array
    num_array = number.to_s.split(//).map(&:to_i).reverse
    # Double every second digit, subtracting 9 when >= 10
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
    # Add each element, test if divisible by 10
    total = 0
    while !doubled.empty?
      new_total = doubled.shift + total
      total = new_total
    end
    (total % 10).zero?
  end
end