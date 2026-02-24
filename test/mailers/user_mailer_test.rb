require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "welcome_email" do
    mail = UserMailer.welcome_email(users(:one))
    assert_equal "Bienvenue chez nous !", mail.subject
    assert_equal [ "one@example.com" ], mail.to
    assert_match "monsite.fr", mail.body.encoded
  end
end
