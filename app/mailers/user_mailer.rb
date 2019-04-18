class UserMailer < ApplicationMailer
#  default from: 'jobboard@example.com'
  #layout 'mailer'
  def everyday_email(user)
    @user = user
#    @category_idd=Category.find_by(id: params[@user.category_id])
    Category.all.each do |kategori|
      if (kategori.id == @user.category_id)
          @company = Company.all
          @job=Job.where(category_id: kategori.id).order(created_at: :desc)
          mail(to: @user.email, subject: 'Every day email')
      end
    end
  end

end
