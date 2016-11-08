class PublicationsController < ApplicationController
  def show
  	  	@publicacion=Publication.find(params[:id])
  end

  def new
  end

  def index
  end
end
