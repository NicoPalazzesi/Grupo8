class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :telefono, :numericality => {:only_integer => true, :message => "Ingrese solo numeros"}

  has_many :publications, dependent: :destroy
  has_many :ofrecimientos, dependent: :destroy
  has_many :qualifications, dependent: :destroy
  
  before_validation :mayor_de_edad

  private
  	def mayor_de_edad #Valida que sea mayor de edad
  		if fecha.present? && fecha > 18.years.ago
     		errors.add(:fecha, ": Usted debe ser mayor de 18 años para Registrarse")
     	end
  	end	
end
