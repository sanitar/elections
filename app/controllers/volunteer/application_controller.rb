class Volunteer::ApplicationController < ApplicationController
	before_filter :authenticate_volunteer!

	def authenticate_volunteer!
		if !current_user.present? and current_user.role_id < 2
			redirect_to root_path
		end
	end
end
