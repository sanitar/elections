class Manager::Statuses::ConversationsController < Manager::ApplicationController
  def index
  	@statuses = ConversationStatus.all.order('created_at DESC')
  	@status = ConversationStatus.new
  end

  def create
  	@status = ConversationStatus.create(statuses_params)
  	redirect_to manager_statuses_conversations_path
  end

  def activate
  end

  def deactivate
  end

	private

	def statuses_params
	  params.require(:conversation_status).permit([:name, :description, :active])
	end
end
