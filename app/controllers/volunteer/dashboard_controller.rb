class Volunteer::DashboardController < Volunteer::ApplicationController
  def index
	@conversations = current_user.conversations.order("created_at DESC").limit(10)  	
  end
end
