class User < ApplicationRecord
  has_many :categories
  validates :email, presence: true,:uniqueness => true
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'Only valid emails allowed!!'
  }

  def self.everyday_update
    @user = User.all
    @user.each do |u|
      UserMailer.everyday_email(u).deliver
    end
  end

end
