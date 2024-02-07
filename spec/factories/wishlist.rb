require 'faker'

FactoryBot.define do
  factory :wishlist do |f|
    f.description { Faker::ChuckNorris.fact }
    f.quantity { Faker::Number.number(digits: 3).to_i }
    f.link { Faker::Internet.url }
    f.purchased {Faker::Boolean.boolean }
   
    association :family_member
  end
end