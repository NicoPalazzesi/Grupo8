class ApplicationMailer < ActionMailer::Base
  default from: 'unagauchada.cuentas@gmail.com'
  layout 'mailer'

  def email_aceptado(user_accepted, user_who_accepted)
  	@user=user_accepted
  	@user_acepto = user_who_accepted
  	mail(to: @user.email, subject:'Ofrecimiento aceptado')
  end

  def email_contacto(user_accepted, user_who_accepted)
  	@user=user_who_accepted
  	@user_aceptado = user_accepted
  	mail(to: @user.email, subject:'Datos de contacto')
  end  

end
