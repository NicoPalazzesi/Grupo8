class PublicationsController < ApplicationController
  
  def index
    @publicaciones = Publication.order("created_at desc")
    @publicaciones = @publicaciones.where("titulo LIKE ?", "%#{params[:buscar_titulo]}%") unless params[:buscar_titulo].nil?
    @publicaciones = @publicaciones.where("ciudad LIKE ?", "%#{params[:buscar_ciudad]}%") unless params[:buscar_ciudad].nil?
  end

  def show
  	  	@publicacion=Publication.find(params[:id])
        @usuarioActual = current_user
        @comentarios = @publicacion.comments
        @ofrecimientos = @publicacion.ofrecimientos
        @ofrecimiento_aceptado = @publicacion.ofrecimientos.find_by(aceptado: true)
        @calificacion_calificado = @publicacion.qualification 
  end

  def new 
      @usuarioActual=current_user
      @publication = Publication.new
  end

  def create
    @publication = Publication.new(params.require(:publication).permit(:titulo, :descripcion, :ciudad, :foto))
    @publication.user = current_user


    if (@publication.user.puntos <=0 )
      flash[:notice] = "No cuenta con los puntos necesarios para crear una publicación"
      redirect_to :action => 'index'
    else
      if @publication.save
        flash[:notice] = "Publicacion creada exitosamente."
        @publication.user.update(puntos: @publication.user.puntos - 1)
        @publication.user.actualizar_logro
        redirect_to root_path
      else
        flash[:notice] = "El titulo de la publicacion ya existe."
        redirect_to :action => 'new'                       
      end    
    end

  end

  def edit
    @publication=Publication.find(params[:id])
  end

  def update

    @publication = Publication.find(params[:id])
    @tituloAnt = @publication.titulo
    #descAnt = @publication.descripcion
    #ciudadAnt = @publication.ciudad
    #fotoAnt = @publication.foto
    
    pu = Publication.find_by(titulo: params[:publication][:titulo]) #pido el nuevo titulo que ingresa
    if pu != nil && pu.titulo != @tituloAnt #si el titulo que ingreso ya existe y no es el mismo que ya estaba entonces ya existe una publicacion con ese nombre
                        #y no es la publicacion que estoy editando
      flash[:notice] = "El titulo de la publicacion ya existe."
      render :edit
    else #si la publicacion no existia o si el titulo que ingreso no pertenece a ninguna publicacion guardada entonces lo dejo editar
      @publication.update(params.require(:publication).permit(:titulo, :descripcion, :ciudad, :foto))
        flash[:notice] = "Publicacion editada exitosamente."
        redirect_to :action => 'index'
    end
  
  end


  def destroy
    Publication.find(params[:id]).destroy
    flash[:notice] = "Publicacion eliminada."
    redirect_to :action => 'index'
  end

end
