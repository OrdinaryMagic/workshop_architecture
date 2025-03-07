# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    books = BooksQuery.call(params)
    render json: {
      books: BookResource.new(
        BookDecorator.decorate_collection(books.to_a)
      ).serialize,
      pagination: {
        current_page: books.current_page,
        total_pages: books.total_pages
      }
    }
  end
end
