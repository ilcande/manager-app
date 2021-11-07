# frozen_string_literal: true

class PaymentRequest
  KEY = "payment_request"
  STORE_LIMIT = 10
  def self.list(limit = STORE_LIMIT)
    $redis.lrange(KEY, 0, limit).map do |raw_payment_request|
      JSON.parse(raw_payment_request)
    end
  end
  def self.push(raw_payment_request)
    $redis.lpush(KEY, raw_payment_request)
    $redis.ltrim(KEY, 0, STORE_LIMIT-1)
  end
end
