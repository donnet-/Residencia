require 'test_helper'

class ModelMailerTest < ActionMailer::TestCase
  test "notificaciones" do
    mail = ModelMailer.notificaciones
    assert_equal "Notificaciones", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
