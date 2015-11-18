class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :city
      t.string :password_digest
      t.string :email
      t.text :bio
      t.string :username

      t.timestamps null: false
    end
  end
end
