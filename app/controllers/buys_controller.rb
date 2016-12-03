class BuysController < ApplicationController

	def new
	end
def create
		@buys=Buy.new(params.require(:buy).permit(:tarjeta, :puntos))
		if @buys.all_digits(params[:buy][:tarjeta]) #Verifico que la tarjeta ingresada sean solo numeros
			@tarjeta = Buy.find_by(tarjeta: @buys.tarjeta) #Busco la tarjeta en la base de datos
			if !(@tarjeta.nil?) #Compruebo la tarjeta estaba en la base
				@buys.user_id=current_user.id
				@buys.save
				current_user.update(puntos: current_user.puntos+@buys.puntos)
				current_user.actualizar_logro
				flash[:notice] = "Compra exitosa. Ha comprado #{@buys.puntos} punto/s con un valor total de $#{@buys.puntos*12}"
				redirect_to root_path
			else
				flash[:notice] = "El número de tarjeta ingresado no es valido. Por favor intente con otra tarjeta"
				redirect_to :action => 'new'
			end
		else
			flash[:notice] = "Ingrese solo los números de la tarjeta"
			redirect_to :action => 'new'
		end
	end

	def index
		redirect_to :action => 'new'
	end
	
	def report
	end

	def result_report

		@finicio = params[:fechaInicio].to_date.beginning_of_day
		@ffinal = params[:fechaFinal].to_date.beginning_of_day

		if @ffinal<=Date.today 
			if @finicio<=@ffinal
				@compras=Buy.where("created_at >= ? AND created_at <= ?", @finicio, @ffinal+1.days)
			else
				flash[:notice] = "La fecha Inicial no debe ser mayor que la fecha Final"
				redirect_to :action => 'report'
			end
		else
			flash[:notice] = "La fecha Final no puede ser mayor que hoy #{Date.today.strftime('%d/%m/%Y')}"
			redirect_to :action => 'report'
		end
	end

end
