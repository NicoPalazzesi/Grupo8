class Qualification < ApplicationRecord
	validates_inclusion_of :calificacion, presence: true, :in => [true, false]
	validates :descripcion, presence: true

	belongs_to :publication
	belongs_to :user
end
