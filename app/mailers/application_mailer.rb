# Application Mailer. Not used now...
class ApplicationMailer < ActionMailer::Base

  default from: 'from@example.com'
  layout 'mailer'

  def welcome_email(user)
    email_to = user[:email]
    subject = 'Welcome'
    body = "Welcome #{user[:username]} !"
    mail(to: email_to, subject: subject, body: body)
  end

end
