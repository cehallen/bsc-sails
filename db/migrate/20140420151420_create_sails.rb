class CreateSails < ActiveRecord::Migration
  def change
    create_table :sails do |t|
      t.date :when, null:false
      t.text :details, null:false

      t.timestamps
    end
  end
end
