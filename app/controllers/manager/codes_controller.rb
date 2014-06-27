class Manager::CodesController < Manager::ApplicationController

	def index
		@codes = Code.where(active: true)
		@out_codes = Code.where(active: false).count
	end

	def create
		params[:total].to_i.times do |i|
			Code.create!(value: Devise.friendly_token.first(8))
		end

		redirect_to manager_codes_path
	end

	def deactivate
		@code = Code.find_by_id(params[:code_id])
		@code.update_column(:active, false)
		redirect_to manager_codes_path
	end

	private

	def code_params
		#params.require(:code).permit([:total])
	end
end
