class CreatePushTypes < ActiveRecord::Migration
  def change
    create_table :push_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
