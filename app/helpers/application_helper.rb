module ApplicationHelper
	def admin
		@current_user.try(:type) == "Admin"
	end
end
