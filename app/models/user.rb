class User < ApplicationRecord
  validates :first_name, prescence: true
  validates :last_name, prescence: true
end
