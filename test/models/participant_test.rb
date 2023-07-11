require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  test "should have a valid name" do
    participant = Participant.new(name: nil, gender: 'Male', date_of_birth: Date.new(1990, 1, 1))
    assert_not participant.valid?
  end

  test "should have a valid gender" do
    participant = Participant.new(name: 'Participant 1', gender: nil, date_of_birth: Date.new(1990, 1, 1))
    assert_not participant.valid?
  end

  test "should have a valid date of birth" do
    participant = Participant.new(name: 'Participant 1', gender: 'Male', date_of_birth: nil)
    assert_not participant.valid?
  end
end
