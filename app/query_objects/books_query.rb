# frozen_string_literal: true

class BooksQuery
  def self.call(params)
    Book.page(params[:page])
        .per(Settings.app.items_per_page)
  end
end
