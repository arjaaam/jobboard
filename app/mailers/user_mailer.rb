class UserMailer < ApplicationMailer

  def everyday_email(user)
    @user = user
    Category.all.each do |kategori|
      if (kategori.id == @user.category_id)
        @company = Company.all
        @job=Job.where(category_id: kategori.id).order(created_at: :desc)
        mail(to: @user.email, subject: 'Every day update')
      end
    end
  end

end
