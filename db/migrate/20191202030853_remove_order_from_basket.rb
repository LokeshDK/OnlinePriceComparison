class RemoveOrderFromBasket < ActiveRecord::Migration[6.0]
  def change
    remove_column :baskets, :order
  end
end
