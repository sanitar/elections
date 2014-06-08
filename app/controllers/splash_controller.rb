class SplashController < ApplicationController
	protect_from_forgery with: :exception

	def index
		if current_user.present?
			case current_user.role_id.to_i
				when 1
					true
				when 2 # волонтер
					redirect_to volunteer_dashboard_index_path
				when 3 # админ
					redirect_to root_path
				else
					true
			end
		end
	end


	def volunteer_me
		if params[:v_code] == '123'
			current_user.update_column(:role_id, 2)
			@ok = true
		else
			@ok = false
		end
	end

end
