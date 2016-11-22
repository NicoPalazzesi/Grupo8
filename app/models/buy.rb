class Buy < ApplicationRecord
	validates :tarjeta, numericality: {only_integer: true}
	
end
