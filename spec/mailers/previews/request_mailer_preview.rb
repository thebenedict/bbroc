# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  def matches_email
    RequestMailer.matches_email(Request.first)
  end
end
