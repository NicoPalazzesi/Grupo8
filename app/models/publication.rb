class Publication < ApplicationRecord
	validates :titulo, presence: true
	validates :titulo, uniqueness: true
	validates :descripcion, presence: true
	validates :ciudad, presence: true
	belongs_to :user
	has_many :comments
	has_many :ofrecimientos
	has_one :qualification
end
