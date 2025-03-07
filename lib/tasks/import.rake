require_relative '../import/pg_to_mongo/books_importer'

namespace :import do
  namespace :pg_to_mongo do
    desc 'Перенос таблицы books из PostgreSQL в MongoDB'
    task :books => [:environment] do
      puts 'Перенос таблицы books начат'
      BooksImporter.call
      puts 'Перенос таблицы books завершен'
    end
  end
end
