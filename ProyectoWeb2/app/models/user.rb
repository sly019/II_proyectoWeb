require 'bcrypt'
#require 'digest'
class User < ActiveRecord::Base
	 #users.password_hash in the database is a :string
    
   #  attr_accessor :username, :password,:password_salt, :password_confirmation
     include BCrypt

  #attr_accessor :password,:password_confirmation

  before_save :encrypt_password  

  #validates_confirmation_of :password

  #validates_presence_of :password, :on => :create

  #validates_presence_of :username

  #validates_uniqueness_of :username
    
    
   # before_save :encrypt_password 
   
   before_update :ensure_authentication_token
    
          
      def encrypt_password  

      if password.present?  
      self.password_salt = BCrypt::Engine.generate_salt  
      self.password= BCrypt::Engine.hash_secret(password, password_salt)  

      end  
      end 

      def self.authenticate(username, pPassword)  
      user = find_by_username(username)  
      #if user && user.password == BCrypt::Engine.hash_secret(pPassword, user.password_salt)  
      user  
      #else  
      #nil  
      end  
  

      def ensure_authentication_token
      length = 8  
      user.token = rand(32**length).to_s(32)   
      end 

end
