# frozen_string_literal: true

FactoryBot.define do
  factory :university do
    name { Faker::University.name }
    location { Faker::Address.country }
    contact_emails { [ Faker::Internet.email, Faker::Internet.email ] }
    website { Faker::Internet.url }

    trait :invalid_emails do
      contact_emails { [ "invalid_email", "example.com" ] }
    end
  end
end
