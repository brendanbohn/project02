class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.date :birthday
      t.string :bio
      t.string :gender
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
