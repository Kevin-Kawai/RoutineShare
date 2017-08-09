class Routine < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :activities
end
