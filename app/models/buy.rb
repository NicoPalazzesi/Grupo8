class Buy < ApplicationRecord
	
	def all_digits(str)
    	str[/[0-9]+/]  == str
	end
end
