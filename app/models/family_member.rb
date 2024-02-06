class FamilyMember < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :first_name, presence: true, format: { with: /\A[\p{L}\-' ]+\z/ }
  validates :relationship, presence: true
  has_many :wishlists, dependent: :destroy
  has_and_belongs_to_many :contacts
end

# regex /\A[\p{L}\-' ]+\z/ checks if first_name contains only letters, hyphens and spaces
