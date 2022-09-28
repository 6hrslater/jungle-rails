class User < ApplicationRecord
  has_secure_password
  before_validation :clean_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true

  def clean_email 
    if self.email != nil
      self.email = email.strip.downcase
    end
  end

  def self.authenticate_with_credentials(email_address, password)
    #email = email_address.strip.downcase
    #^ this does not pass in the front end
    @user = User.find_by_email(email_address.strip.downcase)
    if @user && @user.authenticate(password) 
      @user
    else
      nil
    end
  end

end