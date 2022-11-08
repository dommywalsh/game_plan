class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.float :longitude
      t.float :latitude
      t.text :description

      t.timestamps
    end
  end
end
