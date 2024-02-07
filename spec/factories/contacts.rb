require "faker"

FactoryBot.define do
  factory :contact do |f|
    f.name { "Valid Name" }
    f.phone { Faker::Number.number(digits: 10) }
    f.email { Faker::Internet.email }
    f.description { Faker::ChuckNorris.fact }
    f.category { Faker::Lorem.word }
    f.family_members { create_list(:family_member, 1) }
  end
end
