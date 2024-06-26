class Question < ApplicationRecord
    has_many :options, dependent: :destroy
    has_many :survey_questions, dependent: :destroy
    has_many :surveys, through: :survey_questions
  end