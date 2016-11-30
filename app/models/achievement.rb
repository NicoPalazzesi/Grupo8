class Achievement < ApplicationRecord
	validates :nombre, presence: true
	validates :nombre, uniqueness: true
	validates :rangoMin, numericality: true
	validates :rangoMax, numericality: true
	scope :ordenar_asc, -> {order(rangoMin: :asc)}
	has_many :users
end
