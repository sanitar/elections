class SplashController < ApplicationController
	protect_from_forgery with: :exception

	def index
		if current_user.present?
			case current_user.role_id.to_i
				when 1
					true
				when 2 # волонтер
					redirect_to volunteer_root_path
				when 3 # админ
					redirect_to manager_root_path
				else
					true
			end
		end
	end


	def volunteer_me
		if params[:v_code] == 'volunteer'
			current_user.update_column(:role_id, 2)
			@ok = true
		elsif params[:v_code] == 'manager'
			current_user.update_column(:role_id, 3)
			@ok = true
		else
			@ok = false
		end
	end

end
