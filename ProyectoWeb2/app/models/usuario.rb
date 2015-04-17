class Usuario < ActiveRecord::Base

  #attr_accessor :password_hash
  before_save :encrypt_password
  
  #validates_confirmation_of :password_hash
  #validates_presence_of :password_hast, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username
  
  def encrypt_password
    if password_hast.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hast = BCrypt::Engine.hash_secret(password_hast, password_salt)
    end
  end

  def self.authenticate(username, password_hast)
  #user = find_by_email(username)
  #if user && user.password_hast == BCrypt::Engine.hash_secret(password_hast, user.password_salt)
    user
  #else
   # nil
  #end
  end

end
