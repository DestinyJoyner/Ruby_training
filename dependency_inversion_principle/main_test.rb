require 'minitest/autorun'

class NotificationTest < Minitest::Test
  def test_email_notification
    sender = NotificationSender.new(EmailNotifier.new)
    assert_output("Sent Email: Hello World\n") { sender.send_notification("Hello World") }
  end

  def test_sms_notification
    sender = NotificationSender.new(SMSNotifier.new)
    assert_output("Sent SMS: Hello World\n") { sender.send_notification("Hello World") }
  end

  def test_slack_notification
    sender = NotificationSender.new(SlackNotifier.new)
    assert_output("Sent Slack message: Hello World\n") { sender.send_notification("Hello World") }
  end

  def test_push_notification
    sender = NotificationSender.new(PushNotifier.new)
    assert_output("Sent Push Notification: Hello World\n") { sender.send_notification("Hello World") }
  end
end