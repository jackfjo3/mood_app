class ChangeNames < ActiveRecord::Migration
  def change
    rename_column :moods, :drink, :drank
    rename_column :moods, :smoke, :smoked
    rename_column :moods, :awake, :in_bed
  end
end
