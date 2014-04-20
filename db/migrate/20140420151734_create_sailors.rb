class CreateSailors < ActiveRecord::Migration
  def change
    create_table :sailors do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.text :details, null: false

      t.timestamps
    end
  end
end
