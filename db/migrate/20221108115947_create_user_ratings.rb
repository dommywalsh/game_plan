class CreateUserRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_ratings do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
