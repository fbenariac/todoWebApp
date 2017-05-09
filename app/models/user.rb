# User model
class User < ApplicationRecord

  # pswd attr
  attr_accessor :password  
  
  # Before save => encode pswd                                                       
  before_save :encrypt_password
  
  # Validation of pswd                                                   
  validates :password, confirmation: true, :presence => { on: :create }
  
  # Validation of email     
  validates :email, presence: true, uniqueness: true                        
  
  # Authentification
  def self.authenticate(email, password)

    user = User.find_by_email(email)
    
    if user.present?
      pswd_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
      ( user.password_hash == pswd_hash ) ? user : nil  
    else
      return nil
    end

  end
  
  # Encodage
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
end