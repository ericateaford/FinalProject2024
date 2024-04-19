class ChangeQuizQuestionsToSurveyQuestions < ActiveRecord::Migration[7.0]
  def change
    rename_table :quiz_questions, :survey_questions 
  end
end
