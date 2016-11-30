class CommentsController < ApplicationController

	def new
		@comentario = Comment.new
		@publicacion_id = params[:publicacion]
	end

	def create
		@comentario = Comment.new(params.require(:comment).permit(:descripcion))
		@comentario.publication_id = params[:publication_id] 
		@comentario.user_id = current_user.id
		if @comentario.save
			flash[:notice] = "Comentario publicado."
        	redirect_to @comentario.publication
      	else	
      		flash[:notice] = "No se pudo publicar el comentario"
        	render :new	
    	end
	end

end
