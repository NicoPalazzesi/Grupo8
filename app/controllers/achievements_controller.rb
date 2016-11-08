class AchievementsController < ApplicationController

	def new	
		@achievement = Achievement.new
	end

	def index 
		@achievement = Achievement.all
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
		@achievement = Achivement.all
	end	

	def edit
		@achievement = Achievement.find(params[:id])		
    end

    def update
    	@achievement = Achievement.find(params[:id])		
    	nombreAnt = @achievement.nombre
    	minAnt = @achievement.rangoMin
    	maxAnt = @achievement.rangoMax

    	@achievement.update(params.require(:achievement).permit(:nombre, :rangoMin, :rangoMax))

       	if @achievement.rangoMin > @achievement.rangoMax
       		@achievement.update(nombre: nombreAnt, rangoMin: minAnt, rangoMax: maxAnt)
			flash[:notice] = "Error: El rango mínimo es mayor al rango máximo."
			redirect_to :action => 'edit' 
		else #chequeo que no exista el logro
			logro = Achievement.find_by(nombre: @achievement.nombre) #pido el nuevo nombre que ingresa
			if logro != nil #si el logro que ingreso ya existe entra
				if logro.nombre == nombreAnt #si el nombre que ingreso es el mismo que estoy editando lo guardo
					flash[:notice] = "Logro editado exitosamente."
        			redirect_to :action => 'index'
        		else
        			#si el nombre que estoy ingresando no es el mismo que ya estaba entonces estoy ingresando
        			#un logro que ya existe en la base de datos
					flash[:notice] = "Este logro ya existe."
					redirect_to :action => 'edit'
				end
			else #si el nombre que ingreso no existe entonces lo creo
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
