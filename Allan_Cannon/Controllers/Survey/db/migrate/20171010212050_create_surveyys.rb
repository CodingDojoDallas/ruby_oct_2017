class CreateSurveyys < ActiveRecord::Migration
  def change
    create_table :surveyys do |t|
      t.string :name
      t.string :location
      t.string :language
      t.text :comment

      t.timestamps null: false
    end
  end
end
