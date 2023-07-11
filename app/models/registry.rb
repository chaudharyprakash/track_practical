class Registry < ApplicationRecord
	validates :name, :location, presence: true,  uniqueness: true
	enum state: %w[open close]

	has_many :enrollments
  has_many :participants, through: :enrollments
  has_many :coordinators, through: :enrollments

  PERMITTED_PARAMS = [:name, :location, :state]
end
