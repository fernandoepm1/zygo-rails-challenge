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
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { build(:book) }

  describe 'associations' do
    it 'has the expected associations' do
      expect(book).to belong_to(:author)
    end
  end

  describe 'attributes' do
    it 'has the expected attributes', aggregate_failures: true do
      expect(book).to respond_to(:title)
      expect(book).to respond_to(:description)
      expect(book).to respond_to(:image_url)
      expect(book).to respond_to(:year)
    end
  end

  describe 'indexes' do
    it 'has the expected indexes' do
      expect(book).to have_db_index(:author_id)
    end
  end

  describe 'validations' do
    context 'when the book has no given title' do
      subject(:book) { build_stubbed(:book, title: '') }

      it { is_expected.not_to be_valid }
    end

    context 'when the book has no given description' do
      subject(:book) { build_stubbed(:book, description: '') }

      it { is_expected.not_to be_valid }
    end

    context 'when the book has an invalid year' do
      subject(:book) { build_stubbed(:book, year: -1) }

      it { is_expected.not_to be_valid }
    end
  end
end
