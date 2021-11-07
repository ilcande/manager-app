require 'sneakers/tasks'

namespace :rabbitmq do
  desc "Connect manager to contractor's payment requests"
  task :setup do
    require "bunny"

    conn = Bunny.new.tap(&:start)

    ch = conn.create_channel

    queue_payment_requests = ch.queue("manager_dashboard.payment_requests")

    # bind queue to exchange
    queue_payment_requests.bind("display.payment_requests")

    conn.close
  end
end
