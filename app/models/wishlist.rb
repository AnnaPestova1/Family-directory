class Wishlist < ApplicationRecord
  belongs_to :family_member
  validates :description, presence: true
  validates :link,
            format: {
              with: /\A(http|https):\/\/[^\s]+\z/,
              allow_blank: true
            }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "link", "family_member_id", "id", "id_value", "purchased", "quantity", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["family_member"]
  end
end

# regex /\A(http|https):\/\/[^\s]+\z/ check if link is a valid URL