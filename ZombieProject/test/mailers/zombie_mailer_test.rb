require 'test_helper'

class ZombieMailerTest < ActionMailer::TestCase
  test "decomp_chamge" do
    mail = ZombieMailer.decomp_chamge
    assert_equal "Decomp chamge", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "lost_brain" do
    mail = ZombieMailer.lost_brain
    assert_equal "Lost brain", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
