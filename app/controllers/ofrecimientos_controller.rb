class OfrecimientosController < ApplicationController
  def new
  	@ofrecimiento = Ofrecimiento.new
    @publicacion_id = params[:publicacion]
  end

  def create
    @ofrecimiento = Ofrecimiento.new(params.require(:ofrecimiento).permit(:descripcion, :fecha))
    @ofrecimiento.user_id=current_user.id
    @ofrecimiento.publication_id= params[:publication_id]
    @ofrecimiento.aceptado = false


    if @ofrecimiento.fecha.nil? 
      flash[:notice] = "Ingrese una fecha"
      render :new
    else 
      if @ofrecimiento.fecha < Date.today
        flash[:notice] = "La fecha ingresada no es válida."
        render :new
      else 
        if @ofrecimiento.save
          flash[:notice] = "Te ofreciste exitosamente!"
          redirect_to root_path
        else 
          flash[:notice] = "Error al ofrecerte!"
          render :new
        end
      end
    end  
  end

  def accept
    flash[:notice] = "Has seleccionado un usuario"
    ofre = Ofrecimiento.find(params[:ofrecimiento_aceptado])
    ofre.aceptado = true
    ofre.save
    IntercambiarDatosMailer.email_aceptado(ofre.user, ofre.publication.user).deliver
    IntercambiarDatosMailer.email_contacto(ofre.user, ofre.publication.user).deliver
    redirect_to root_path
  end

end
