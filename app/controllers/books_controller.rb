# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: :show

  def index
    @q = Book.includes(:author).ransack(params[:q])

    @books = @q.result(distinct: true).page(params[:page])
  end

  def show; end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
