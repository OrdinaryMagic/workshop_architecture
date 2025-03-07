# frozen_string_literal: true

class AuthorDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{first_name} #{last_name} #{middle_name}"
  end
end
