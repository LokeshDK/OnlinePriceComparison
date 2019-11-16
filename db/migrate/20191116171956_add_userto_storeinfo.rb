class AddUsertoStoreinfo < ActiveRecord::Migration[6.0]
  def change
    add_reference :storeinfos, :user, foreign_key: true
  end
end
