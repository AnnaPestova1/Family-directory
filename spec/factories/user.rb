require "faker"

FactoryBot.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.password do
      Faker::Internet.password(
        min_length: 15,
        max_length: 20,
        mix_case: true,
        special_characters: true
      )
      # f.password_confirmation(f.password)
    end
  end
end
