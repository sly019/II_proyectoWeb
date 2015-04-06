class SesionesController < ApplicationController

def new
	@users = User.new
end

def create
	if @users = login(params[:user],params[:password])
		render json: 'token'
	else
		render json: 'error'
	end
end

def destroy
	logout
	redirect_to(:products, message: "logget out")
end


end
