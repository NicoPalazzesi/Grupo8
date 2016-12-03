class AchievementsController < ApplicationController

	def new	
		@achievement = Achievement.new
	end

	def index 
		if user_signed_in?
			if current_user.admin
				@achievements = Achievement.all.ordenar_asc
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
			logro = Achievement.find_by(nombre: params[:achievement][:nombre]) #pido el nuevo nombre que ingresa		
			if !logro.nil? && logro.borrado == true then				
				# si el logro existe y esta borrado logicamente entonces lo activo
				flash[:notice] = "Este logro tiene vinculado ciertos usuarios. Asegurate de reactivarlo."
       			redirect_to :action => 'index'
			else
				if !logro.nil? && logro.borrado == false then 
					# si el logro existe pero no esta borrado entonces no puedo crearlo ya que existe
					flash[:notice] = "Este logro ya existe."
       				redirect_to :action => 'new'
				else
					if logro.nil? then
						@achievement.borrado = false # le asigno false cuando lo creo
						@achievement.save
						User.all.each do |usuario|
        					usuario.actualizar_logro
        				end
						flash[:notice] = "Logro creado exitosamente."
         				redirect_to :action => 'index'
         			end
         		end
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
        		User.all.each do |usuario|
        			usuario.actualizar_logro
        		end
        		flash[:notice] = "Logro editado exitosamente."
        		redirect_to :action => 'index'
        	end
     	end
    end

	def destroy
		@achievement = Achievement.find(params[:id])
		if @achievement.users.empty? then
			Achievement.find(params[:id]).destroy
      		flash[:notice] = "Logro eliminado."
     		redirect_to :action => 'index'			
      	else # significa que tiene algun usuario asociado por lo tanto se hace baja logica			
			@achievement.borrado = true
			@achievement.save
			flash[:notice] = "Logro eliminado logicamente."
     		redirect_to :action => 'index'
      	end	
	end

	def reactivar
		@achievement = Achievement.find(params[:id])
		@achievement.borrado = false
		@achievement.save
		flash[:notice] = "Logro reactivado exitosamente."
  	 	redirect_to :back
	end

end

