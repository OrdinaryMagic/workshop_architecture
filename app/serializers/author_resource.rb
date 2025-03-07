# frozen_string_literal: true

class AuthorResource
  include Alba::Resource

  attributes :id, :full_name
end
