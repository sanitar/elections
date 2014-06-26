class Volunteer::DialogController < Volunteer::ApplicationController
  def index
  	@conversations = current_user.conversations.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @conversation = Conversation.new
  end

  def contact
    params[:settings][:district].present? ? district = [params[:settings][:district].to_i.to_s] : district = [0,1,2]
    params[:settings][:sex].present? ? sex = [params[:settings][:sex].to_i] : sex = [1,2]

  	@conversation = current_user.talk_to(Voter.ready_to_talk(district, sex).order("RANDOM()").limit(1)[0].id)
    render :show
  end

  def show
  	@conversation = current_user.conversations.find_by_id(params[:id])
  end

  def update_conversation_status
    @status = ConversationStatus.find_by_id(params[:conversation_status_id])
    @conversation = current_user.conversations.find_by_id(params[:id])
    @conversation.update_column(:status_id, @status.id)

    respond_to do |format|
      format.js
    end
  end

  def update_voter_status
    @status = VoterStatus.find_by_id(params[:voter_status_id])
    @conversation = current_user.conversations.find_by_id(params[:id])
    @conversation.voter.update_column(:status_id, @status.id)

    respond_to do |format|
      format.js
    end
  end

  def next
  end
end
