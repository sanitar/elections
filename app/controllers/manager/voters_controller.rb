class Manager::VotersController < Manager::ApplicationController
  def index
  	@voters = Voter.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def show
  	@voter = Voter.find_by_id(params[:id])

  	respond_to do |format|
  		format.js
  	end
  end
end
