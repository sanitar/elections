class Manager::DashboardController < Manager::ApplicationController

	def index
		@voters = Voter.count
		@volunteers = User.count
		@conversations = Conversation.count
		
		@conversations_by_status = Conversation.select("count(*) as total, status_id").group(:status_id).to_a
	end
end
