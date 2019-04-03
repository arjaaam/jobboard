class Company < ApplicationRecord
  has_many :jobs

  has_one_attached :image #look
  #accepts_nested_attributes_for :jobs
  validates :name, :company_statement,:logo,:url,:email, presence: true
  validates :email, format: {
      with: URI::MailTo::EMAIL_REGEXP,
      message: 'only valid allowed'
    }
    def self.search(search)
      # Title is for the above case, the OP incorrectly had 'name'
      where("name LIKE ?", "%#{search}%")
    end


end
