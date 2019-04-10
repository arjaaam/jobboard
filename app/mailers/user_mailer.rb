class UserMailer < ApplicationMailer
  default from: 'jobboard@example.com'

  def everyday_email
    @user = params[:user]
    mail(to: @user.email, subject: 'List jobs')
  end

end
