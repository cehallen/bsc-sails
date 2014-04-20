class DropSailorsAndConnectionsTables < ActiveRecord::Migration
  def change
    drop_table :sailors
    drop_table :connections
  end
end
