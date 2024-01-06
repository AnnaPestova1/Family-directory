class FamilyMember < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :relatioship, presence: true
end
