# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: :show

  def index
    @q = Book.ransack(params[:q])

    books = @q.result(distinct: true)
    load_authors && count_books(books) if books.any?

    @books = @q.result(distinct: true)
               .includes(:author)
               .order(title: :asc)
               .page(params[:page])
  end

  def show; end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def load_authors
    @authors = Author.all
  end

  def count_books(books)
    @books_count = books.count
  end
end
