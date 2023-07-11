class Participant < ApplicationRecord
	has_many :enrollments
  has_many :registries, through: :enrollments
  has_many :coordinators, through: :enrollments

  validates :name, :gender, :date_of_birth, presence: true
  validates :name, uniqueness: { scope: :gender }

  PERMITTED_PARAMS = [:name, :gender, :date_of_birth]

  # Provide sql for aggregate count of participants by year of birth.
  scope :count_by_year_of_birth, -> { group("EXTRACT(YEAR FROM date_of_birth)").count }

	#Provide sql for aggregate count of participants by coordinator and gender
	scope :count_by_coordinator_and_gender, -> { joins(:enrollments).group("enrollments.coordinator_id, participants.gender").count }

  # Export participants for each coordinator in a csv format.
  def self.to_csv
    attributes = %w[name gender date_of_birth]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |participant|
        csv << attributes.map { |attr| participant.send(attr) }
      end
    end
  end
end
