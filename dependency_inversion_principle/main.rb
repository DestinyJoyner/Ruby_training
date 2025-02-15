class NotificationSender
  def send_notification(type, message)
    type.send(message)
  rescue NotImplementedError => e
    puts e.message
  end
end

# use module for reuse send method in notifier classes

module Notifier
  def send(message)
    raise NotImplementedError, "Notification type must implement 'send' method"
  end
end

class EmailNotifier
  include Notifier
  def send(message)
    puts "Sent Email: #{message}"
  end
end

class SMSNotifier
  include Notifier
  def send(message)
    puts "Sent SMS: #{message}"
  end
end

class SlackNotifier
  include Notifier
  def send(message)
    puts "Sent Slack message: #{message}"
  end
end

notification_sender = NotificationSender.new

notification_sender.send_notification(EmailNotifier.new, 'This is an email message.')

notification_sender.send_notification(SMSNotifier.new, 'This is an SMS message.')

notification_sender.send_notification(SlackNotifier.new, 'This is a Slack message.')

# notification_sender.send_notification("email", "This is an email message.")

# notification_sender.send_notification("sms", "This is an SMS message.")

# notification_sender.send_notification("slack", "This is a Slack message.")

# begin
#   notification_sender.send_notification("unsupported", "This is an unsupported message.")
# rescue => e
#   puts e.message
# end
