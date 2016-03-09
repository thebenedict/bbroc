class CustomMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
end

def confirmation_instructions(record, token, opts={})
  opts[:from] = 'Team Best Broccoli'
  opts[:reply_to] = 'info@bestbroccoli.com'
  opts[:subject] = 'Confirm your Best Broccoli account'
  super
end

def reset_password_instructions(record, token, opts={})
  opts[:from] = 'Team Best Broccoli'
  opts[:reply_to] = 'info@bestbroccoli.com'
  opts[:subject] = 'Reset your Best Broccoli password'
  super
end

def password_change(record, token, opts={})
  opts[:from] = 'Team Best Broccoli'
  opts[:reply_to] = 'info@bestbroccoli.com'
  opts[:subject] = 'Your Best Broccoli password was changed'
  super
end

def unlock_instructions(record, token, opts={})
  opts[:from] = 'Team Best Broccoli'
  opts[:reply_to] = 'info@bestbroccoli.com'
  opts[:subject] = 'Unlock your Best Broccoli account'
  super
end
