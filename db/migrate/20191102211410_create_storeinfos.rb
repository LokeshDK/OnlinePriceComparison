class CreateStoreinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :storeinfos do |t|
      t.string :storename
      t.string :address
      t.integer :phoneno
      t.string :buisnessid
      t.integer :branchcount
      t.string :storeincharge
      t.integer :contactno
      t.string :image

      t.timestamps
    end
  end
end
