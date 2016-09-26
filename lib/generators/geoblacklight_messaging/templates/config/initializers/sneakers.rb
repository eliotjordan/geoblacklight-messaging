require 'sneakers'
require_relative 'messaging_config'
Sneakers.configure(
  amqp: Messaging.config['events']['server'],
  exchange: Messaging.config['events']['exchange']['geoblacklight'],
  exchange_type: :fanout
)
Sneakers.logger.level = Logger::INFO
