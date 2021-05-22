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
end