class CreateProductinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :productinfos do |t|
      t.string :productname
      t.string :storeproductid
      t.decimal :productprice
      t.references :branchinfo, null: false, foreign_key: true
      t.string :image
      t.references :categorie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
