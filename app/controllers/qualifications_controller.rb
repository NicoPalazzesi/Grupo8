class QualificationsController < ApplicationController

	def new
		@calificaciones=Qualification.new
		@usuario_id = params[:user_ofrecido]
		@publicacion_id = params[:publicacion_id]
	end

	def create
		@calificaciones = Qualification.new(params.require(:qualification).permit(:calificacion, :descripcion))
		@calificaciones.user_id = params[:user_ofrecido]
		@calificaciones.publication_id = params[:publicacion_id]
		@calificaciones.calificado=true
		
		

		if @calificaciones.save
			if @calificaciones.calificacion
				
				@calificaciones.user.puntos = @calificaciones.user.puntos + 1
				#Como hago para verificar que marco una opcion de la checkbox y no ninguna o las 2? Podria solucionarlo con un f.select?
				#Como hago que esa opcion sea true o false.
				#Como posiciono los botones
			else
				@calificaciones.user.puntos = @calificaciones.user.puntos - 2
				#Resto 2 puntos
			end
			@calificaciones.user.save
			flash[:notice] = "Su puntuación se guardo exitosamente"
			redirect_to root_path
		else
			flash[:notice] = "Marque una puntuación para el usuario"
			render :new
		end
		
	end

end
