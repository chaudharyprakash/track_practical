class Coordinator < ApplicationRecord
  has_many :enrollments
  has_many :participants, through: :enrollments
  has_many :registries, through: :enrollments

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :phone_number,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }

  PERMITTED_PARAMS = [:name, :email, :phone_number]
end
