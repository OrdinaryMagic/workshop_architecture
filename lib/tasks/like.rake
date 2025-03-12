desc 'Ставим like'
task like: :environment do
  json_path = Rails.root.join('spec', 'fixtures', 'like.json').to_path
  payload = JSON.parse(File.read(json_path)).to_json
  Karafka.producer.produce_async(
    topic: 'likes',
    payload: payload
  )
end
