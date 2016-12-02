class AnswersController < ApplicationController

	def create
		@comentario = Comment.find(params[:comment_id])
		@respuesta = @comentario.create_answer(params.require(:answer).permit(:descripcion))
		flash[:notice] = "Respuesta publicada."
        redirect_to @comentario.publication
	end
end
