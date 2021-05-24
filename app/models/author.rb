# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  age        :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord
  has_many :books

  validates :name, :age, presence: true
  validates :age, numericality: { only_integer: true,
                                  greater_than: 0 }
end
