class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :address
      t.integer :phoneno
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
