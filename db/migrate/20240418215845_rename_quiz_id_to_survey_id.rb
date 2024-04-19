class RenameQuizIdToSurveyId < ActiveRecord::Migration[7.0]
  def change
    rename_column :survey_questions, :quiz_id, :survey_id
  end
end
