class Book
  include Mongoid::Document

  field :title, type: String
  field :file_path, type: String
  field :published_at, type: String
  field :filename, type: String
  field :ext, type: String
  field :folder_id, type: String
  field :likes_count, type: Integer, default: 0

  def authors
    Author.joins(:books_authors).where(books_authors: { book_id: id })
  end

  def genres
    Genre.joins(:books_genres).where(books_genres: { book_id: id })
  end

  def folder
    Folder.find(folder_id)
  end
end
