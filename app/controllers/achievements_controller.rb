class AchievementsController < ApplicationController

	def new	
		@achievement = Achievement.new
	end

	def index 
		if user_signed_in?
			if current_user.admin
				@achievement = Achievement.all
			else
				redirect_to "/"
			end
		else 
			redirect_to "/"
		end

	end 

	def create
		@achievement = Achievement.new(params.require(:achievement).permit(:nombre, :rangoMin, :rangoMax))
		
		if @achievement.rangoMin > @achievement.rangoMax
			flash[:notice] = "Error: El rango mínimo es mayor al rango máximo."
			redirect_to :action => 'new' 
		else 
			if @achievement.save
				flash[:notice] = "Logro creado exitosamente."
         		redirect_to :action => 'index'
         		
      		else
      			flash[:notice] = "Este logro ya existe."
        		redirect_to :action => 'new'		
        		
    		end
    	end
	end

	def show
		@achievement = Achievement.all
	end	

	def edit
		@achievement = Achievement.find(params[:id])		
    end

    def update
    	@achievement = Achievement.find(params[:id])		
    	nombreAnt = @achievement.nombre
    	minAnt = @achievement.rangoMin
    	maxAnt = @achievement.rangoMax

    	@minNew = params[:achievement][:rangoMin]
    	@maxNew = params[:achievement][:rangoMax]

       	if @minNew > @maxNew
			flash[:notice] = "Error: El rango mínimo es mayor al rango máximo."
			render :edit 
		else #chequeo que no exista el logro
			logro = Achievement.find_by(nombre: params[:achievement][:nombre]) #pido el nuevo nombre que ingresa
			if logro != nil && logro.nombre != nombreAnt #si el logro que ingreso ya existe y no es el que estoy editando entonces ya existe
						# un logro con ese nombre
				flash[:notice] = "Este logro ya existe"
        		render :edit
			else #si el nombre que ingreso no existe entonces lo creo
        		@achievement.update(params.require(:achievement).permit(:nombre, :rangoMin, :rangoMax))
        		flash[:notice] = "Logro editado exitosamente."
        		redirect_to :action => 'index'
        	end
     	end
    end

	def destroy
		Achievement.find(params[:id]).destroy
		flash[:notice] = "Logro eliminado."
      	redirect_to :action => 'index'
	end
end
