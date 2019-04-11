# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def everyday_email_previev
    UserMailer.everyday_email(User.first)
  end

end
