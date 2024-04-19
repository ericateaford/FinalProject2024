class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.boolean :is_survey
      t.text :desc

      t.timestamps
    end
  end
end
