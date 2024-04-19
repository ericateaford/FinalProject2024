class SurveyQuestionsController < ApplicationController
  before_action :set_survey_question, only: %i[ show edit update destroy ]

  # GET 
  def index
    @survey_questions = SurveyQuestion.all
  end

  # GET 
  def show
  end

  # GET 
  def new
    @survey_question = SurveyQuestion.new
  end

  # GET 
  def edit
  end

  # POST 
  def create
    @survey_question = SurveyQuestion.new(survey_question_params)

    respond_to do |format|
      if @survey_question.save
        format.html { redirect_to survey_question_url(@survey_question), notice: "Survey question was successfully created." }
        format.json { render :show, status: :created, location: @survey_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @survey_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT 
  def update
    respond_to do |format|
      if @survey_question.update(survey_question_params)
        format.html { redirect_to survey_question_url(@survey_question), notice: "Survey question was successfully updated." }
        format.json { render :show, status: :ok, location: @survey_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survey_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE 
  def destroy
    @survey_question.destroy

    respond_to do |format|
      format.html { redirect_to survey_questions_url, notice: "Survey question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_question
      @survey_question = SurveyQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_question_params
      params.require(:survey_question).permit(:survey_id, :question_id, :points)
    end
end
