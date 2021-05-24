# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :load_authors, only: :index

  def index
    @q = Book.ransack(params[:q])

    books = @q.result(distinct: true)
    @books_count = books.count

    @books = books.includes(:author)
                  .order(title: :asc)
                  .page(params[:page])
  end

  private

  def load_authors
    @authors = Author.all
  end
end
