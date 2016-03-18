class RequestMailer < ApplicationMailer
  default from: 'admin@bestbroccoli.com'
 
  def new_request_email(request)
    @request = request
    mail(to: ['thebenedict@gmail.com', 'ericmpadron@gmail.com'], subject: '[bbroc] New request')
  end

  def matches_email(request, opts={})
    @request = request
    opts[:reply_to] = 'info@bestbroccoli.com'
    opts[:subject] = 'We found it!'
    mail(to: request.user.email, 
      bcc: ['thebenedict@gmail.com', 'ericmpadron@gmail.com'], 
      from: '"Team Best Broccoli" <info@bestbroccoli.com>')
  end
end
