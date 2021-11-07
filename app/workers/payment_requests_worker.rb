class PaymentRequestsWorker
  include Sneakers::Worker

  from_queue "manager_dashboard.payment_requests", env: nil

  def work(raw_payment_request)
    PaymentRequest.push(raw_payment_request)
    ack!
  end
end
