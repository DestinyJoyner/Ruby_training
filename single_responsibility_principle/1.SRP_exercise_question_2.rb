# Exercise: Consider the following OrderManager class,
# which is responsible for processing orders,
# calculating taxes, and sending order confirmations.
# Refactor it to follow the Single Responsibility Principle.

class OrderManager
  def initialize(calculate_tax, send_confirmation_email)
    @calculate_tax = calculate_tax
    @send_confirmation_email = send_confirmation_email
  end

  def process_order(order)
    puts "Processing order #{order[:id]} with total #{order[:total]}"
    @calculate_tax.calculate_tax(order[:total])
    @send_confirmation_email.send_confirmation_email(order[:id])
  end
end

class CalculateTax
  def calculate_tax(total)
    tax = total * 0.08
    puts "Calculated tax: #{tax}"
  end
end

class SendConfirmationEmail
  def send_confirmation_email(id)
    puts "Sending confirmation email for order #{id}"
  end
end

# instances
calculate_tax = CalculateTax.new
send_confirmation_email = SendConfirmationEmail.new

order = { id: 1, total: 100 }
order_manager = OrderManager.new(calculate_tax, send_confirmation_email)

order_manager.process_order(order)
