class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.integer :user_id
      t.string :question1
      t.string :question2
      t.string :question3
      t.string :question4
      t.string :question5

      t.timestamps null: false
    end
  end
end
