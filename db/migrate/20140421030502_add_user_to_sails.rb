class AddUserToSails < ActiveRecord::Migration
  def change
    add_column :sails, :user_id, :integer, null: false
  end
end
