class Manager::VotersController < Manager::ApplicationController
  def index
  	@voters = Voter.order('created_at DESC').paginate(page: params[:page], per_page: 15)
  end

  def show
  end
end
