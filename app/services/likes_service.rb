# frozen_string_literal: true

class LikesService
  include Callable
  extend Dry::Initializer

  option :action, type: Dry::Types['strict.symbol']
  option :params, type: Dry::Types['strict.hash']

  def call
    case action
    when :like
      Likes::CreateLike.call(
        Book.find(params[:id])
      )
    end
  end
end
