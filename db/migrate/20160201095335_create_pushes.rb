class CreatePushes < ActiveRecord::Migration
  def change
    create_table :pushes do |t|
      t.datetime :p_date
      t.string :content
      t.integer :competitor_id
      t.integer :type_id

      t.timestamps null: false
    end
  end
end
