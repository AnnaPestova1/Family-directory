class FamilyMember < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :relationship, presence: true
end
