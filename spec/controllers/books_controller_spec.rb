# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    subject(:get_index) { get :index, params: params }

    before { get_index }

    context 'when no params are present' do
      let!(:books) { create_list(:book, 5) }
      let(:params) { {} }

      it 'returns http status 200 and renders index template', :aggregate_failures do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end

      it 'returns all @books ordered by title' do
        expect(assigns(:books).to_a).to eq(books.sort_by(&:title))
      end
    end

    context 'when filtering by title or description' do
      let!(:first_book) do
        create(:book, title: 'First book', description: 'First description')
      end
      let!(:second_book) do
        create(:book, title: 'Second book', description: 'Second description')
      end

      context 'when filtering by title' do
        let(:params) do
          { q: { title_or_description_cont: first_book.title } }
        end

        it 'returns http status 200 and renders index template', :aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(response).to render_template(:index)
        end

        it 'returns only the matching book', :aggregate_failures do
          expect(assigns(:books).to_a).to eq([first_book])
          expect(assigns(:books).to_a).not_to include(second_book)
        end
      end

      context 'when filtering by description' do
        let(:params) do
          { q: { title_or_description_cont: second_book.description } }
        end

        it 'returns http status 200 and renders index template', :aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(response).to render_template(:index)
        end

        it 'returns only the matching books', :aggregate_failures do
          expect(assigns(:books).to_a).to eq([second_book])
          expect(assigns(:books).to_a).not_to include(first_book)
        end
      end
    end

    context 'when filtering by author' do
      let(:first_author) { create(:author, name: 'Tolkien') }
      let(:second_author) { create(:author) }
      let!(:first_book) { create(:book, author: first_author) }
      let!(:second_book) { create(:book, author: second_author) }

      let(:params) do
        { q: { author_id_eq: first_author.id.to_s } }
      end

      it 'returns http status 200 and renders index template', :aggregate_failures do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end

      it 'returns only matching books', :aggregate_failures do
        expect(assigns(:books).to_a).to eq([first_book])
        expect(assigns(:books).to_a).not_to include(second_book)
      end
    end

    context 'when ordering by book title descending' do
      let!(:books) { create_list(:book, 5) }
      let(:params) do
        { q: { s: 'title desc' } }
      end

      it 'returns http status 200 and renders index template', :aggregate_failures do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end

      it 'returns all @books ordered by title descending' do
        expect(assigns(:books).to_a).to eq(books.sort_by(&:title).reverse)
      end
    end
  end
end
