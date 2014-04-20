class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :sailor_id
      t.integer :sail_id

      t.timestamps
    end
  end
end
