# frozen_string_literal: true

10.times do
  author = FactoryBot.create(:author)

  5.times do
    FactoryBot.create(:book, author: author)
  end
end
