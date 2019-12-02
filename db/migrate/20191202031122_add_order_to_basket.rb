class AddOrderToBasket < ActiveRecord::Migration[6.0]
  def change
    add_column :baskets, :order, :string, array: true, default: '{}'
  end
end
