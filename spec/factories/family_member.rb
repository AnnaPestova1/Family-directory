require "faker"

FactoryBot.define do
  factory :family_member do |f|
    f.first_name { Faker::Name.first_name }
    f.relationship { Faker::Relationship.familial }
    user_id { User.first.id }
  end
end
