class Contact < ApplicationRecord
  has_and_belongs_to_many :family_members
  validates :name, presence: true, format: { with: /\A[\p{L}\-' ]+\z/ }
  validates :phone, presence: true
  validates :phone, numericality: { only_integer: true }
  validates :phone, length: { is: 10 }
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z]{2,}\z/i, allow_blank: true }
  validates :category, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["category", "created_at", "description", "email", "id", "id_value", "name", "phone", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["family_members"]
  end
end

# regex /\A[\p{L}\-' ]+\z/ check if name contains only letters, hyphens, apostrophes and spaces
# regex /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z]{2,}\z/i check if email is a valid format
