class RequestMailer < ApplicationMailer
  default from: 'admin@bestbroccoli.com'
 
  def new_request_email(request)
    @request = request
    mail(to: ['thebenedict@gmail.com', 'ericmpadron@gmail.com'], subject: '[bbroc] New request')
  end
end
