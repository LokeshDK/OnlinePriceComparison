class CreateBranchinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :branchinfos do |t|
      t.string :branchname
      t.string :address
      t.integer :phoneno
      t.string :branchincharge
      t.integer :contactno
      t.references :storeinfo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
