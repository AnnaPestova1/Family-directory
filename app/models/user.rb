class User < ApplicationRecord
  validates :first_name, presence: true, format: { with: /\A[\p{L}\-' ]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[\p{L}\-' ]+\z/ }
  has_many :family_members, dependent: :destroy
end

# regex /\A[\p{L}\-' ]+\z/ checks if first_name and last_names contains only letters, hyphens and spaces