class AddMissionStatementToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mission_statement, :text
  end
end
