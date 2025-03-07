# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all
  decorates_association :authors

  def file_path
    "#{folder.name}/#{filename}.#{ext}"
  end
end
