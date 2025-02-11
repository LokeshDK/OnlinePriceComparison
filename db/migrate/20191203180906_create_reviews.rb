class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :productinfo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
