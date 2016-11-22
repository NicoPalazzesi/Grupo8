class Qualification < ApplicationRecord
	validates :calificacion, presence: true #:in => [true, false]

	belongs_to :publication
	belongs_to :user
end
