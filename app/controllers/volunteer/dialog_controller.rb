class Volunteer::DialogController < Volunteer::ApplicationController
  def index
  	@conversations = current_user.conversations.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def construct_text_from(pattern, person)
    while !(opening_bracket_index = pattern.index('{')).nil?
      puts pattern
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

  def contact
    voter = Voter.ready_to_talk.order("RANDOM()").limit(1)[0]
  	@conversation = current_user.talk_to(voter.id)
    @patterns = Pattern.suitable_for(voter)
    @patterns.each do |pattern|
      pattern.text = construct_text_from(pattern.text, voter)
    end
  end

  def show
  	@conversation = current_user.conversations.find_by_id(params[:id])
  end

  def next
  end
end
