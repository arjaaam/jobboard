class UserMailer < ApplicationMailer
  default from: 'jobboard@example.com'
  #layout 'mailer'
  def everyday_email(user)
    @user = user
    mail(to: @user.email, subject: 'Every day email')
  end

end
