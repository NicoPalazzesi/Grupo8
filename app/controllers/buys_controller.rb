class BuysController < ApplicationController

	def new
	end
def create
		@buys=Buy.new(params.require(:buy).permit(:tarjeta, :puntos))
		if @buys.all_digits(params[:buy][:tarjeta]) #Verifico que la tarjeta ingresada sean solo numeros
			@tarjeta = Buy.find_by(tarjeta: @buys.tarjeta) #Busco la tarjeta en la base de datos
			if !(@tarjeta.nil?) #Compruebo la tarjeta estaba en la base
				@buys.save
				current_user.puntos=current_user.puntos+@buys.puntos
				current_user.save
				flash[:notice] = "Compra exitosa. Ha comprado #{@buys.puntos} punto/s con un valor total de $#{@buys.puntos*12}"
				redirect_to root_path
			else
				flash[:notice] = "El número de tarjeta ingresado no es valido. Por favor intente con otra tarjeta"
				render :new
			end
		else
			flash[:notice] = "Ingrese solo los números de la tarjeta"
			render :new
		end
	end

	def index
		redirect_to :action => 'new'
	end

end
