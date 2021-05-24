# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/index.html.slim', type: :view do
  describe 'books/index' do
    before do
      assign(:q, Book.ransack(params[:q]))
      assign(:authors, Author.all)
    end

    context 'when no books are present' do
      let(:books) { [] }
      let(:paginated_books) do
        Kaminari.paginate_array(books).page(1)
      end

      before do
        assign(:books, paginated_books)

        render
      end

      it 'renders filters' do
        rendered.should render_template(partial: 'books/_filters')
      end

      it 'does not display any books' do
        rendered.should have_text('No books were found.')
      end
    end

    context 'when at least one book is present' do
      let(:books) { create_list(:book, 5) }
      let(:paginated_books) do
        Kaminari.paginate_array(books).page(1)
      end

      before do
        assign(:books, paginated_books)
        assign(:books_count, books.size)

        render
      end

      it 'renders filters' do
        rendered.should render_template(partial: 'books/_filters')
      end

      it 'display all books' do
        rendered.should have_text("#{books.size} books found.")
      end

      it 'display all informations of the books' do
        books.each do |book|
          rendered.should have_text(book.title)
          rendered.should have_text(book.description)
          rendered.should have_text(book.year.to_s)
          rendered.should have_text(book.author.name)
        end
      end
    end
  end
end
