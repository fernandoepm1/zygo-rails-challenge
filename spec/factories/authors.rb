# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    name { Faker::Book.author }
    age { Faker::Number.between(from: 20, to: 80) }
  end
end
