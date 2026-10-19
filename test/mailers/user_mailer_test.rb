require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "welcome" do
    # Create the email and store it for further assertions
    user = Struct.new(:email).new("me@example.com")
    email = UserMailer.welcome_email(user)

    # Send the email and verify one email was delivered
    assert_emails 1 do
      email.deliver_now
    end

    # Verify recipient and subject
    assert_equal ["me@example.com"], email.to
    assert_equal "Welcome to the app", email.subject
  end
end
