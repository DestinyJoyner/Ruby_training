class DiscountService
  def initialize(discount_type)
    @discount_type = discount_type
  end

  def apply_discount(amount, discount_value)
    @discount_type.process_discount(amount, discount_value)
  end
end

class PercentageDiscount
  def process_discount(amount, discount_value)
    amount - (amount * (discount_value / 100.0))
  end
end

class FixedDiscount
  def process_discount(amount, discount_value)
    # like Math.max -> 2 args returns the highest of the values
    [amount - discount_value, 0].max
  end
end

class LoyaltyDiscount
  def process_discount(amount, discount_value)
    amount - (discount_value * 0.5)
  end
end

percentage_discount = PercentageDiscount.new
fixed_discount = FixedDiscount.new
loyalty_discount = LoyaltyDiscount.new

# select randomly from array
discount_type = [percentage_discount, fixed_discount, loyalty_discount].sample

# Usage
discount_service = DiscountService.new(discount_type)
discounted_amount = discount_service.apply_discount(100.0, 10)
# puts discount_type
puts "Discounted amount: #{discounted_amount}"

# class DiscountService
#   def apply_discount(discount_type, amount, discount_value)
#     case discount_type
#     when :percentage
#       apply_percentage_discount(amount, discount_value)
#     when :fixed_amount
#       apply_fixed_discount(amount, discount_value)
#     when :loyalty_points
#       apply_loyalty_discount(amount, discount_value)
#     else
#       puts "Unknown discount type"
#     end
#   end

#   private

#   def apply_percentage_discount(amount, discount_value)
#     amount - (amount * (discount_value / 100.0))
#   end

#   def apply_fixed_discount(amount, discount_value)
#     [amount - discount_value, 0].max
#   end

#   def apply_loyalty_discount(amount, discount_value)
#     amount - (discount_value * 0.5)
#   end
# end
