class Company < ApplicationRecord
  has_many :jobs
  has_one_attached :image
  validates :name, :company_statement,:url,:email,:company_description, presence: true
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'only valid allowed'
  }
  
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
