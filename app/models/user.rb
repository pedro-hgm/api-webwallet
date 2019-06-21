class User < ApplicationRecord
  has_many :accounts
  # password
  has_secure_password

  # validation  
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/
  
  # callbacks
  before_save :downcase_email

  def downcase_email
  self.email = self.email.delete(' ').downcase
  end

end
