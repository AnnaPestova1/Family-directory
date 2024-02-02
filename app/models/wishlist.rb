class Wishlist < ApplicationRecord
  belongs_to :family_member
  validates :description, presence: true
  validates :link,
            format: {
              with: /\A(http|https):\/\/[^\s]+\z/,
              allow_blank: true
            }
end

# regex /\A(http|https):\/\/[^\s]+\z/ check if link is a valid URL