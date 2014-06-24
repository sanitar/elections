class Volunteer::DashboardController < Volunteer::ApplicationController
  def index
	@conversations = current_user.conversations.limit(10)  	
  end
end
