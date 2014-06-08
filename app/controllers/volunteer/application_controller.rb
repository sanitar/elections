class Volunteer::ApplicationController < ApplicationController
	before_filter :authenticate_volunteer!

	layout "volunteer"

	def authenticate_volunteer!
		if !current_user.present? or current_user.role_id < 2
			redirect_to root_path
		end
	end
end
