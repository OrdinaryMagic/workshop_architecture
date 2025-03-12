# frozen_string_literal: true

# Example consumer that prints messages payloads
class LikesConsumer < ApplicationConsumer
  def consume
    messages.each { |message| process_message(message) }
  end

  private

  def process_message(message)
    payload = message.payload.symbolize_keys
    Rails.logger.info("topic: #{topic.name}, client: #{[client.id, client.name].join('_')}, payload: #{payload}")
    LikesService.call(
      action: payload[:action].to_sym,
      params: payload[:params].transform_keys(&:to_sym)
    )
  end
end
