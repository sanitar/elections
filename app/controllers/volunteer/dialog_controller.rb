class Volunteer::DialogController < Volunteer::ApplicationController
  def index
  	@conversations = current_user.conversations.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def construct_text_from(pattern, person)
    while !(opening_bracket_index = pattern.index('{')).nil?
      closing_bracket_index = pattern.index('}')
      if !pattern[opening_bracket_index+1, closing_bracket_index-opening_bracket_index].index('{').nil?
        closing_bracket_index = closing_bracket_index + pattern.slice(closing_bracket_index+1..-1).index('}') + 1
      end
      point_of_interest = JSON.parse(pattern[opening_bracket_index,closing_bracket_index-opening_bracket_index+1])
      point_of_interest.each_key { |key|
        if point_of_interest[key].class == String
          pattern = pattern.slice(0,opening_bracket_index) + person.send(key) + pattern.slice(closing_bracket_index+1..-1)
        else
          value = person.send(key).to_s
          default = true
          point_of_interest[key].each_key { |variant|
            if variant == value
              pattern = pattern.slice(0,opening_bracket_index) + point_of_interest[key][variant] + pattern.slice(closing_bracket_index+1..-1)
              default = false
              break
            end
          }
          if default # TODO: discuss what to do when information provided, but no case coincides with it
            pattern = pattern.slice(0,opening_bracket_index) + pattern.slice(closing_bracket_index+1..-1)
          end
        end
      }
    end
    pattern
  end

  def new
    @conversation = Conversation.new
  end


  def contact
  	params[:settings][:district].present? ? district = [params[:settings][:district].to_i.to_s] : district = ['0','1','2']
    	params[:settings][:sex].present? ? sex = [params[:settings][:sex].to_i] : sex = [1,2]
    voter = Voter.ready_to_talk(district, sex).order("RANDOM()").limit(1)[0]
  	@conversation = current_user.talk_to(voter.id)
    @pattern = Pattern.suitable_for(voter).order("RANDOM()").limit(1)[0]
    @pattern.text = construct_text_from(@pattern.text, voter)
  	render :show
  end

  def show
  	@conversation = current_user.conversations.find_by_id(params[:id])

    @pattern = Pattern.suitable_for(@conversation.voter).order("RANDOM()").limit(1)[0]
    @pattern.text = construct_text_from(@pattern.text, @conversation.voter)
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
