class MessengerWebhookController < ApplicationController
  def webhook
    if ENV['MESSENGER_VALIDATION_TOKEN'].present? and params['hub.verify_token'] == ENV['MESSENGER_VALIDATION_TOKEN']
      render plain: params['hub.challenge']
    else
      render plain: 'Error: wrong validation token, silly'
    end
  end
end