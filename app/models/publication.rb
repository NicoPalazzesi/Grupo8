class Publication < ApplicationRecord
	validates :titulo, presence: true
	validates :titulo, uniqueness: true
	validates :descripcion, presence: true
	validates :ciudad, presence: true
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :ofrecimientos, dependent: :destroy
	has_one :qualification
end
