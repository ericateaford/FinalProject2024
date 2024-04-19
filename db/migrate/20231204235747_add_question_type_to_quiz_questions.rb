class AddQuestionTypeToSurveyQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :survey_questions, :question_type, :string
  end
end
