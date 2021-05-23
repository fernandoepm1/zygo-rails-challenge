# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :string
#  image_url   :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint           not null
#
FactoryBot.define do
  factory :book do
    author

    title { Faker::Book.title }
    image_url { 'https://i.pinimg.com/736x/d6/c9/fc/d6c9fcf5155be81b318904b1576a9242.jpg' }
    description { Faker::Lorem.paragraph }
    year { Faker::Number.between(from: 1920, to: 2021) }
  end
end
