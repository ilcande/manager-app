# frozen_string_literal: true

RABBITMQ_URL = ENV.fetch('RABBITMQ_URL', 'amqp://localhost:5672')
RABBITMQ_PASSWORD = ENV.fetch('RABBITMQ_PASSWORD', 'guest')
RABBITMQ_USERNAME = ENV.fetch('RABBITMQ_USERNAME', 'guest')
RABBITMQ_VHOST = ENV.fetch('RABBITMQ_VHOST', '/')
