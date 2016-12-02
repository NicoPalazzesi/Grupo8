class UsersController < ApplicationController
  
  def new
  end

  def index
  end

  def show
    @usuario=User.find(params[:id])
  end

  def edit  
  end
  
  def destroy
    usuario=User.find(params[:id])
    usuario.destroy
    if usuario.save
      flash[:notice]="Usuario eliminado exitosamente"
    end
  end

  def report
  end

  def update
  end

  def sign_in
  end

end


