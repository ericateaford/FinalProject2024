class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy ]

  # GET 
  def index
    @surveys = Survey.all
  end

  # GET 
  def show
  end

  def pre_new
    @survey = Survey.new
  end

  # surveys_controller.rb
  def new
    @survey = Survey.new(is_survey: params[:is_survey] == '1')
    params[:number_of_questions].to_i.times { @survey.survey_questions.build }
  end

  # GET /
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST 
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to survey_url(@survey), notice: "Survey was successfully created." }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT 
  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE 
  def destroy
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: "Survey was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:title, :desc, :is_survey, survey_questions_attributes: [:id, :question_id, :points])
    end
end
