# Preview all emails at http://localhost:3000/rails/mailers/intercambiar_datos_mailer
class IntercambiarDatosMailerPreview < ActionMailer::Preview
	
	def email_aceptado_preview
		IntercambiarDatosMailer.email_aceptado(User.first, User.last)
	end

	def email_contacto_preview
		IntercambiarDatosMailer.email_contacto(User.first, User.last)
	end
end
