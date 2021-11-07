require_relative '../models/payment_request'

class PaymentRequestController < ApplicationController
  expose :payment_requests

  def index
    @payment_requests = PaymentRequest.all
  end

  def show; end

  def update
    if @payment_request.update_attributes(payment_request_params)

    else
      render :edit
    end
  end

  private

  def payment_request_params
    params.require(:payment_request).permit(:amount, :currency, :description, :status)
  end

  def find_payment_request
    @payment_request = PaymentRequest.find(params[:id])
  end
end
