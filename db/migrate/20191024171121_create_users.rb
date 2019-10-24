class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :phone
      t.string :password

      t.timestamps
    end
  end
end
