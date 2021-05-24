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
class Book < ApplicationRecord
  belongs_to :author

  validates :title, :description, :year, presence: true
  validates :year, numericality: { only_integer: true,
                                   greater_than: 0 }
end
