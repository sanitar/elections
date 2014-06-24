class Manager::Statuses::VotersController < Manager::ApplicationController
  def index
  	@statuses = VoterStatus.order('created_at DESC')
  	@status = VoterStatus.new
  end

  def create
  	@status = VoterStatus.create(statuses_params)
  	redirect_to manager_statuses_voters_path
  end

  def activate
  end

  def deactivate
  end

	private

	def statuses_params
	  params.require(:voter_status).permit([:name, :description, :active])
	end
end
