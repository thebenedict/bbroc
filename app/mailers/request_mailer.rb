class RequestMailer < ApplicationMailer
  default from: 'admin@bestbroccoli.com'
 
  def new_request_email(request)
    @request = request
    mail(to: ['thebenedict@gmail.com', 'ericmpadron@gmail.com'], subject: '[bbroc] New request')
  end

  def request_confirmation_email(request, opts={})
    @request = request
    opts[:reply_to] = 'info@bestbroccoli.com'
    mail(to: request.user.email,
      subject: "Your request on Best Broccoli",
      bcc: ['thebenedict@gmail.com', 'ericmpadron@gmail.com'], 
      from: '"Team Best Broccoli" <info@bestbroccoli.com>')
  end

  def matches_email(request, opts={})
    @request = request
    opts[:reply_to] = 'info@bestbroccoli.com'
    mail(to: request.user.email,
      subject: "#{@request.body}!",
      bcc: ['thebenedict@gmail.com', 'ericmpadron@gmail.com'], 
      from: '"Team Best Broccoli" <info@bestbroccoli.com>')
  end
end
