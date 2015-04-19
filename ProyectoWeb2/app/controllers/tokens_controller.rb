class TokensController < ApplicationController
skip_before_filter :verify_authenticity_token
  respond_to :json

  require 'digest/md5'

  # crear token POST /tokens.json
  def create
      # tomamos las variables del POST
      username = params[:username]
      password = params[:password]
      #savePass = params[:password]
      # aquí mandamos un mensaje por si no nos hacen un post a /tokens sin .json
      if request.format == :json
          render :status=>406, :json=>{:message=>"solo se aceptan peticiones json :(" + username + password}
          return
      end
  
      # aquí mandamos un mensaje por si no nos mandaron las variables email o password
      if username.nil? || password.nil?
          render :status=>400,
          :json=>{:message=>"Algo anda mal con tu POST :("}
          return
      end
  
      #buscamos el usuario por el usuario
     @user = User.find_by_username(username)

    if @user.nil?
      render :status=>401, :json=>{:message=>"tu usuario o password son incorrectos"}
      return
    end


    #@demo = password = Digest::MD5.hexdigest(password)
    @demo = Digest::MD5.hexdigest(password)
    #@demo = password = MD5.new(password).to_s
    if @user.password.to_s == @demo.to_s
      if request.format != :json

          length = 8  
          token = rand(32**length).to_s(32)  
          #user1 = User.new({'username' => username, 'password' => password, 'token' => token})
          #@user.update({'username' => username, 'password' => password, 'token' => token})

          #respond_to do |format|
          if @user.update({'username' => username, 'password' => Digest::MD5.hexdigest(password), 'token' => token})
            #ormat.html { redirect_to @user, notice: 'User was successfully created.' }
            #format.json { {'username' => username, 'password' => password, 'token' => token}}
            render :json=> {:token=> token, :id=> @user.id,:password => @user.password, status: :ok}
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
          #end

          #render :json=> {:token=> token}
          #return

      end
    else
      render :json=> {:mensaje=> "tu usuario o password son incorrectos !!"}  
      return  
    end

      #if @user && @user.password_hash == BCrypt::Engine.hash_secret(password, @user.password_salt)  
      #user  
      #else  
      #nil  
      #end

      #enviamos un mensaje por si no existe el usuario
      if @user.nil?
      render :status=>401, :json=>{:message=>"tu email o password son incorrectos :("}
      return
      end
  
      #generamos el token y lo guardamos
      #@user.ensure_authentication_token!
  
      #validamos el password y si es correcto devolvemos el token :)
      #if @user.valid_password?(password)
       #   render :status=>200, :json=>{:token=>@user.authentication_token}
      #else
      #render :status=>401, :json=>{:message=>"tu email o password son incorrectos :("}
      #end
  end

  def update
    token = request.headers['token']
    is_login(token)

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # elimar token DELETE /tokens/sznxbcmshad.json
  def destroy
      # buscamos el usuario por el token
      @user = User.find_by_authentication_token(params[:id])
      
      # si lo encontramos eliminamos el token y si no le mandamos un mensaje
      if @user
          @user.reset_authentication_token!
          render :status=>200, :json=>{:token=>params[:id]}
      else
          render :status=>404, :json=>{:message=>'token no valido.', :token => params[:id]}
      end
  end

  # esta función la hicimos solo para obtener los datos del usuario con la sesión abierta
  def getUser
      # de nuevo si no nos piden un json los mandamos a volar 
      if request.format != :json
          render :status=>406, :json=>{:message=>"solo json :("}
          return
      end

      # aqui les mandamos el json del usuario
      user = current_user
      render :status=>200, :json=>{:user=>user}
  end



end
