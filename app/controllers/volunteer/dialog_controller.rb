class Volunteer::DialogController < Volunteer::ApplicationController
  def index
  	@conversations = current_user.conversations
  end

  def contact
  	@conversation = current_user.talk_to(Voter.ready_to_talk.order("RANDOM()").limit(1)[0].id)
  end

  def show
  	@conversation = current_user.conversations.find_by_id(params[:id])
  end

  def next
  end
end
