class Ofrecimiento < ApplicationRecord
	validates :descripcion, presence: true
	validates :fecha, presence: true 
	belongs_to :user
	belongs_to :publication
end
