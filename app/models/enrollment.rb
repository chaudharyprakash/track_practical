class Enrollment < ApplicationRecord
  belongs_to :participant
  belongs_to :registry
  belongs_to :coordinator

  validates :date_of_enrollment, :method_of_contact, :remarks, presence: true

  PERMITTED_PARAMS = [:participant_id, :registry_id, :coordinator_id, :date_of_enrollment, :method_of_contact, :remarks]
end
