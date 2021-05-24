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
require 'rails_helper'

RSpec.describe Author, type: :model do
  subject(:author) { build(:author) }

  describe 'associations' do
    it 'has the expected associations' do
      expect(author).to have_many(:books)
    end
  end

  describe 'attributes' do
    it 'has the expected attributes', aggregate_failures: true do
      expect(author).to respond_to(:name)
      expect(author).to respond_to(:age)
    end
  end

  describe 'validations' do
    context 'when the author has no given name' do
      subject(:author) { build_stubbed(:author, name: '') }

      it { is_expected.not_to be_valid }
    end

    context 'when the author has no given age' do
      subject(:author) { build_stubbed(:author, age: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'when the author has an invalid age' do
      subject(:author) { build_stubbed(:author, age: -1) }

      it { is_expected.not_to be_valid }
    end
  end
end
