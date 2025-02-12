class EcommerceOrderService
  
  def initialize(validate_inventory, process_payment, send_confirmation)
    @validate_inventory = validate_inventory
    @process_payment = process_payment
    @send_confirmation = send_confirmation
  end

  def process_order(order)
    if @validate_inventory.validate_inventory(order[:id], order[:items])
      if @process_payment.process_payment(order[:id], order[:total])
        @send_confirmation.send_confirmation(order[:id])
        puts "Order processed successfully: #{order[:id]}"
      end
    end
  end
end


# validate,process_payment, send_confirmation
class InventoryValidator
  def validate_inventory(id, items)
    unless items.empty?
      puts "Validating inventory for order: #{id}"
      true
    else
      puts "Insufficient inventory for order: #{id}"
    end
  end
    
end

class PaymentProcessor
  def process_payment(id, total)
    unless total <= 0
      puts "Processing $#{total} payment for order: #{id}"
      true
    else
      puts "Payment of $#{total} failed for order: #{id}"
    end
  end
end

class ConfirmationSender
  def send_confirmation(id)
    puts "Sending confirmation for order: #{id}"
  end
end

# instances
validate_inventory = InventoryValidator.new
process_payment = PaymentProcessor.new
send_confirmation = ConfirmationSender.new

order = { id: 101, items: ["item1", "item2"], total: 50.0 }
order_2 = { id: 101, items: [], total: 30.0 }
order_3 = { id: 101, items: ["item1", "item2"], total: 0.0 }
order_service = EcommerceOrderService.new(validate_inventory,process_payment,send_confirmation)
order_service.process_order(order)
# order_service.process_order(order_2)
# order_service.process_order(order_3)
