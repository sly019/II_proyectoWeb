require 'bcrypt'
require 'digest/md5'
#require 'digest'
class User < ActiveRecord::Base
   #users.password_hash in the database is a :string
    include BCrypt
    #before_save :encrypt_password #, only: [:create] 
    #before_update :update_user, only: [:update] 
    
          
      def encrypt_password  

      if password.present?
      #self.password = BCrypt::Engine.generate_salt  
      self.password = Digest::MD5.hexdigest(self.password)
      #self.password = MD5.new(self.password).to_s

      #self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
      end  
      end 



      #def self.authenticate(username, password)  
      #user = find_by_username(username)  
      #if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)  
      #user  
      #else  
      #nil  
      #end 
    #end
end
