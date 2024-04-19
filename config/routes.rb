Rails.application.routes.draw do
  get 'surveys/pre_new', to: 'surveys#pre_new', as: :pre_new_survey
  get '/question_types', to: 'pages#question_types'
  get 'viewquestion', to: 'questions#index'

  resources :surveys do
    resources :survey_questions
  end

  resources :questions do
    resources :options
  end

  root "pages#home"
end