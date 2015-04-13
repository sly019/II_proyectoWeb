require 'bcrypt'
#require 'digest'
class User < ActiveRecord::Base
	 #users.password_hash in the database is a :string
    include BCrypt
    before_save :encrypt_password 
    
          
      def encrypt_password  

      if password.present?  
      self.password = BCrypt::Engine.generate_salt  
      #self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
      end  
      end 

      def self.authenticate(username, password)  
      user = find_by_username(username)  
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)  
      user  
      else  
      nil  
      end  
      end  

end
