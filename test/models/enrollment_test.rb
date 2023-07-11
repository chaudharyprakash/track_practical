require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  test "should have a valid date of enrollment" do
    enrollment = Enrollment.new(date_of_enrollment: nil, method_of_contact: 'phone', remarks: 'Enrollment 1')
    assert_not enrollment.valid?
  end

  test "should have a valid method of contact" do
    enrollment = Enrollment.new(date_of_enrollment: Date.today, method_of_contact: nil, remarks: 'Enrollment 1')
    assert_not enrollment.valid?
  end

end
