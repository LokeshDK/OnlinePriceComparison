class DropColumnCategorieIdFromProductInfos < ActiveRecord::Migration[6.0]
  def change
    remove_column :productinfos, :categorie_id, :integer
  end
end
