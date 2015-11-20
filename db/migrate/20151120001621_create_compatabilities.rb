class CreateCompatabilities < ActiveRecord::Migration
  def change
    create_table :compatabilities do |t|
      t.integer :score
      t.integer :user_id
      t.integer :questionnaire_id

      t.timestamps null: false
    end
  end
end
