require 'test_helper'

class CoordinatorTest < ActiveSupport::TestCase
  test "should have a valid email" do
    coordinator = Coordinator.new(name: 'John Doe', email: nil, phone_number: '1234567890')
    assert_not coordinator.valid?
  end

  test "should have a valid phone number" do
    coordinator = Coordinator.new(name: 'John Doe', email: 'john@example.com', phone_number: nil)
    assert_not coordinator.valid?
  end

end
