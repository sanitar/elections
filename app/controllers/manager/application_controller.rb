class Manager::ApplicationController < ApplicationController

	before_filter :authenticate_manager!
	layout "manager"

	def authenticate_manager!
		if !current_user.present? or current_user.role_id < 3
			redirect_to root_path
		end
	end
end
