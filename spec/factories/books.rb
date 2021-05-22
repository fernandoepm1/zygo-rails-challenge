# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    author

    title { Faker::Book.title }
    sub_title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    year { Faker::Number.between(from: 1920, to: 2021) }
  end
end
