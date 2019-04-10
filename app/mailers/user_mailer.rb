class UserMailer < ApplicationMailer
  default from: 'jobboard@example.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'List jobs')
  end

end
