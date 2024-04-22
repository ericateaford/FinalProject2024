class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    if params[:type]
      @questions = Question.where(question_type: params[:type])
    else
      @questions = Question.all
    end
  end

  # GET /questions/1 or /questions/1.json
  def show
    @question = Question.find(params[:id])
    @options = @question.options
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_url(@question), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question = Question.find(params[:id]) 
    @question.options.each { |option| option.destroy }
    @question.survey_questions.each { |survey_question| survey_question.destroy }
    @question.destroy
    respond_to do |format|
      format.html { redirect_to question_types_url, notice: "Question was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:desc, :question_type)
    end
end
