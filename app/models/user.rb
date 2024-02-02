class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, password_strength: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, format: { with: /\A[\p{L}\-' ]+\z/ }
  validates :last_name, format: { with: /\A[\p{L}\-' ]+\z/ }
  has_many :family_members, dependent: :destroy
  has_many :contacts, through: :family_members
  has_many :wishlists, through: :family_members
end

# regex /\A[\p{L}\-' ]+\z/ checks if first_name and last_names contains only letters, hyphens and spaces