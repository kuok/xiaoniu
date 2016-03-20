class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.string :name
      t.string :alias
      t.string :logo

      t.timestamps null: false
    end
  end
end
