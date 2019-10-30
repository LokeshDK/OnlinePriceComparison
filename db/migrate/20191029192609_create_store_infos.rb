class CreateStoreInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :store_infos do |t|
      t.string :store_name
      t.string :address
      t.integer :phone_no
      t.string :buisness_id
      t.integer :branches
      t.string :store_incharge
      t.integer :contact_no

      t.timestamps
    end
  end
end
