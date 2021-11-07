# frozen_string_literal: true

$redis = Redis::Namespace.new("manager_dashboard:#{Rails.env}", redis: Redis.new)
