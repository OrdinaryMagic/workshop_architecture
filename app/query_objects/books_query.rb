# frozen_string_literal: true

class BooksQuery
  def self.call(params)
    Book.preload(:folder, :authors, :genres)
        .page(params[:page])
        .per(Settings.app.items_per_page)
  end
end
