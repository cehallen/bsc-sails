class AddTitleToSails < ActiveRecord::Migration
  def up
    add_column :sails, :title, :string, null:false
  end

  def down
    remove_column :sails, :title
  end
end
