class LoginNotifierMailer < ApplicationMailer
  default from: "mailer@#{ENV['EMAIL_DOMAIN']}"

  def send_result(email, status, user_agent)
    @status = status
    @user_agent = user_agent
    mail(
      to: email,
      subject: 'WebService - Login result'
    )
  end
end
