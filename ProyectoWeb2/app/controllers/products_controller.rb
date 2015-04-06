class ProductsController < ApplicationController

	def index
		#render text: "hola"
		@products = Product.all
		render json: @products
	end

	def show
		if @products = Product.find(params[:id])
			render json: @products
		else
			redirect_to '422'
		end
	end

	def new		
	end

	def create
		#render text: "hola"
		@products = Product.new(product_params)		
		if @products.save
			render json: @products
		else
			redirect_to '422'
		end
	end

	def edit
	end	

	def update
		#render text: "hola"
		@products = Product.find(params[:id])			
		if @products.update_attributes(product_params)
			render json: @products
		else
			redirect_to '422'
		end
	end

	def destroy
	end

	private
	def product_params
		#params[:email] almacena el post que envia el usuario
		params.require(:product).permit(:name, :description, :status)
	end

	

	

end
