class Contact < ApplicationRecord
  belongs_to :family_member
  validates :name, presence: true, format: { with: /\A[\p{L}\-' ]+\z/ }
  validates :phone, presence: true
  validates :phone, numericality: { only_integer: true }
  validates :phone, length: { is: 10 }
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z]{2,}\z/i, allow_blank: true }
  validates :category, presence: true
end

# regex /\A[\p{L}\-' ]+\z/ check if name contains only letters, hyphens, apostrophes and spaces
# regex /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z]{2,}\z/i check if email is a valid format
