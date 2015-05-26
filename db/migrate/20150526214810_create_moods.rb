class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.integer :user_id
      t.integer :energy
      t.integer :happiness
      t.integer :motivation
      t.integer :love
      t.boolean :smoke
      t.boolean :drink
      t.boolean :awake
      t.text :notes
      t.boolean :special

      t.timestamps null: false
    end
  end
end
