# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Lorem.sentence }
    admin { false }
    password { 'strong_password' }
  end
end
