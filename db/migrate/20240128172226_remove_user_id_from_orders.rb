class RemoveUserIdFromOrders < ActiveRecord::Migration[6.0]
  remove_foreign_key :orders, :users, column: :user_id

  def change
    remove_column :orders, :user_id, :integer
  end
end
