class Buy < ApplicationRecord

	belongs_to :user

	def all_digits(str)
    	str[/[0-9]+/]  == str
	end

end
