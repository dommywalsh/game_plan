class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :desciption
      t.integer :capacity
      t.integer :first_place_points
      t.integer :second_place_points
      t.integer :losing_points

      t.timestamps
    end
  end
end
