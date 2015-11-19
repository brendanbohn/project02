class AddImageToChildren < ActiveRecord::Migration
  def change
    add_column :children, :image, :string
  end
end
