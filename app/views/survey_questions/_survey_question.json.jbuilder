json.extract! survey_question, :id, :survey_id, :question_id, :points, :created_at, :updated_at
json.url survey_question_url(survey_question, format: :json)
