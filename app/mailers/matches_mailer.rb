class MatchesMailer < ActionMailer::Base
  default from: "info@bestbroccoli.com"
  layout 'mailer'
end

def matches_email(request)
  @request = request
  opts[:from] = 'Team Best Broccoli <info@bestbroccoli.com>'
  opts[:reply_to] = 'info@bestbroccoli.com'
  opts[:subject] = 'We found it!'
end
