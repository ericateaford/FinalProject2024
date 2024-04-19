json.extract! survey, :id, :title, :is_survey, :desc, :created_at, :updated_at
json.url survey_url(survey, format: :json)
