class Manager::DashboardController < Manager::ApplicationController

	def index
		@voters = Voter.count
		@volunteers = User.count
		@conversations = Conversation.count
		
	end
end
