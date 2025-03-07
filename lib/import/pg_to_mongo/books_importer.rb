# frozen_string_literal: true

class BooksImporter
  BATCH_SIZE = 50000
  FIELDS = %w[created_at updated_at title series serno libid size filename del ext published_at insno folder_id language_id].freeze

  def self.call
    Book.collection.drop
    offset = 0
    begin
      batch = ActiveRecord::Base.connection.select_all <<-SQL
        SELECT id as _id, #{FIELDS.join(', ')} FROM books ORDER BY id LIMIT #{BATCH_SIZE} OFFSET #{offset}
      SQL
      Book.collection.insert_many(batch.as_json) if batch.count > 0
      offset += BATCH_SIZE
    end until batch.empty?
    puts "Пересено #{Book.count} книг"
  end
end
