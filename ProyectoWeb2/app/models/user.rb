#require 'bcrypt'
#require 'digest'
class User < ActiveRecord::Base
	 #users.password_hash in the database is a :string
    #include BCrypt

    #salt = BCrypt::Engine.generate_salt
	#encrypted_password = BCrypt::Engine.hash_secret(password, salt)

		#has_secure_password
		#@key = Crypt::Rijndael.new('llave')
	#include BCrypt

   # def password
      #@password ||= User.new(password_hash)
    #end

    #def password=(new_password)

     # Digest::SHA2.hexdigest(password_hash)
      #self.salt = ActiveSupport::SecureRandom.base64(8)
      #self.hashed_password = Digest::SHA2.hexdigest(self.salt + submitted_password)
      #@password = User.create(new_password)
      #@password = key.encrypt_string('dato a cifrar')
      #self.password_hash = @password
    #end
    
      before_save :encrypt_password  
          
      def encrypt_password  

      if password.present?  
      self.password = BCrypt::Engine.generate_salt  
      #self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
      end  
      end  

end
