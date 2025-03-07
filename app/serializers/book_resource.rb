# frozen_string_literal: true

class BookResource
  include Alba::Resource

  attributes :id, :title, :file_path, :published_at

  many :authors
  many :genres
end
