class Comment < ApplicationRecord
	validates :descripcion, presence: true
	belongs_to :user
	belongs_to :publication
end
