class Manager::PatternsController < Manager::ApplicationController
  before_action :set_pattern, only: [:show, :edit, :update, :destroy]

  # GET /patterns
  # GET /patterns.json
  def index
    @patterns = Pattern.all
  end

  # GET /patterns/1
  # GET /patterns/1.json
  def show
  end

  # GET /patterns/new
  def new
    @pattern = Pattern.new
  end

  # GET /patterns/1/edit
  def edit
  end

  # POST /patterns
  # POST /patterns.json
  def create
    text = pattern_params["text"] 
    @pattern = Pattern.new(pattern_params)

    while !(opening_bracket_index = text.index('{')).nil?
      closing_bracket_index = text.index('}')
      if closing_bracket_index.nil?
        raise "unbalanced parenthesis"
      end
      if !text[opening_bracket_index+1, closing_bracket_index-opening_bracket_index].index('{').nil?
        slc = text.slice(closing_bracket_index+1..-1)
        closing_bracket_index_diff = slc.index('}')
        if closing_bracket_index_diff.nil?
          raise "unbalanced parenthesis"
        end
        closing_bracket_index = closing_bracket_index + closing_bracket_index_diff + 1
      end
      json = JSON.parse(text[opening_bracket_index,closing_bracket_index-opening_bracket_index+1])
      json.each_key { |key|
        @pattern.send(key+"=",1)
      }
      text = text.slice(closing_bracket_index+1..-1)
    end

    respond_to do |format|
      if @pattern.save
        format.html { redirect_to [:manager, @pattern], notice: 'Pattern was successfully created.' }
        format.json { render :show, status: :created, location: @pattern }
      else
        format.html { render :new }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patterns/1
  # PATCH/PUT /patterns/1.json
  def update
    raise "unsupported method"
    respond_to do |format|
      if @pattern.update(pattern_params)
        format.html { redirect_to @pattern, notice: 'Pattern was successfully updated.' }
        format.json { render :show, status: :ok, location: @pattern }
      else
        format.html { render :edit }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patterns/1
  # DELETE /patterns/1.json
  def destroy
    @pattern.destroy
    respond_to do |format|
      format.html { redirect_to patterns_url, notice: 'Pattern was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pattern
      @pattern = Pattern.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pattern_params
      params.require(:pattern).permit(:text, :first_name, :last_name, :middle_name, :district, :email, :mobile, :skype, :age, :sex, :conversation_status)
    end
end
