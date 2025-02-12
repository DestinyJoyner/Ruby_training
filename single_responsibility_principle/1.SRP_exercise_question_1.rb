class UserManager
  def initialize(create_user, send_welcome_email, generate_report)
    @create_user = create_user
    @send_welcome_email = send_welcome_email
    @generate_report = generate_report
  end

  def manage_user(username, email)
    @create_user.create_user(username)
    @send_welcome_email.send_welcome_email(email)
    @generate_report.generate_report(username)
  end
end

# Single Responsibility Principle Refactor
class CreateUser
  def create_user(username)
    puts "Creating user #{username}"
  end
end

class SendWelcomeEmail
  def send_welcome_email(email)
    puts "Sending welcome email to #{email}"
  end
end

class ReportGenerator
  def generate_report(username)
    puts "Generating report for user #{username}"
  end
end

# create instance of each class to be used in UserManager
create_user = CreateUser.new
send_welcome_email = SendWelcomeEmail.new
generate_report = ReportGenerator.new

# create instance of user manager passing in all supported instances
user_manager = UserManager.new(create_user, send_welcome_email, generate_report)

test_user = { username: 'jdoe', email: 'jdoe@example.com' }

# check that it runs
user_manager.manage_user(test_user[:username], test_user[:email])
# user_manager.create_user("jdoe", "jdoe@example.com")``
