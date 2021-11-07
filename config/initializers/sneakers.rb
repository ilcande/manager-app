# frozen_string_literal: true

Sneakers.configure({})
Sneakers.logger.level = Logger::INFO

require_relative '../../app/workers/payment_requests_worker'
