class BuysController < ApplicationController

	def new
	end

	def create
		@buys=Buy.new(params.require(:buy).permit(:tarjeta, :puntos))
		if @buys.save
		current_user.puntos=current_user.puntos+@buys.puntos
		current_user.save
		flash[:notice] = "Compra exitosa"
		redirect_to root_path
		else
		flash[:notice] = "Ingrese solo los numeros de la tarjeta"
		render :new
		end
	end

	def index
		redirect_to :action => 'new'
	end

end
