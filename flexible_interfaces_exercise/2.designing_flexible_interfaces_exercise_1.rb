class PaymentService
  def initialize(payment_types = [])
    @payment_types = payment_types
  end

  def process_payment(amount, user)
    @payment_types.each do |payment|
      payment.process(amount, user)
    end
  end
end

# create dif classes that share same method name (perform individual tasks)
# update paymentService class to iterate through given payment types and call shared method on argument
# creditCard, paypal, banktransfer

class CreditCard
  def process(amount, user)
    puts "Processing credit card payment of $#{amount} for #{user[:name]}"
  end
end

class PayPal
  def process(amount, user)
    puts "Processing PayPal payment of $#{amount} for #{user[:name]}"
  end
end

class BankTransfer
  def process(amount, user)
    puts "Processing bank transfer of $#{amount} for #{user[:name]}"
  end
end

# Usage

# payment_method instances
credit_card_payment = CreditCard.new
paypal_payment = PayPal.new
bank_transfer_payment = BankTransfer.new

payment_types = [credit_card_payment, paypal_payment, bank_transfer_payment]

payment_service = PaymentService.new(payment_types)

user = { name: "John Doe" }
payment_service.process_payment(100.0, user)
# payment_service.process_payment(:credit_card, 100.0, user)

# class PaymentService
  # def process_payment(payment_type, amount, user)
  #   case payment_type
  #   when :credit_card
  #     process_credit_card(amount, user)
  #   when :paypal
  #     process_paypal(amount, user)
  #   when :bank_transfer
  #     process_bank_transfer(amount, user)
  #   else
  #     puts "Unknown payment type"
  #   end
  # end

  # private

  # def process_credit_card(amount, user)
  #   puts "Processing credit card payment of #{amount} for #{user[:name]}"
  # end

  # def process_paypal(amount, user)
  #   puts "Processing PayPal payment of #{amount} for #{user[:name]}"
  # end

  # def process_bank_transfer(amount, user)
  #   puts "Processing bank transfer of #{amount} for #{user[:name]}"
  # end
# end