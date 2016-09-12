class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.integer :author_id, null: false, index: true
      t.boolean :completed, null: false, default: false
      t.boolean :private, null: false, default: false
      t.text :details

      t.timestamps null: false
    end
  end
end
