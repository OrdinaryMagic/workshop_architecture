# frozen_string_literal: true

class Likes::CreateLike
  include Callable
  extend Dry::Initializer

  param :book

  def call
    book.inc(likes_count: 1)
  end
end
