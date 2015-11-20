module UsersHelper
	def calculate_age(birthday)
	  Date.today.year - birthday.to_date.year
	end
end
