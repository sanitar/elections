class Manager::VolunteersController < Manager::ApplicationController
  def index
  	@volunteers = User.volunteers.order('created_at DESC').paginate(page: params[:page], per_page: 15)
  end

  def show
  end
end
