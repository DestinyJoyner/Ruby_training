Problem:
Implementing a Notification System
You are working on a Notification Service that sends different types of notifications (Email, SMS, and Slack). Currently, the NotificationSender class directly depends on concrete classes (EmailNotifier, SMSNotifier, SlackNotifier), making it hard to extend and test.

Your task is to refactor the implementation using DIP, ensuring that:

NotificationSender depends on an abstraction (Notifier) instead of concrete classes.
New notification methods can be added without modifying NotificationSender.
Existing test cases remain unchanged.
