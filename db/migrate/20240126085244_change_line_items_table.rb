class ChangeLineItemsTable < ActiveRecord::Migration[6.0]
  def change
    remove_index :line_items, %i[product_id user_id]

    remove_foreign_key :line_items, :users, column: :user_id
    remove_column :line_items, :user_id, :integer

    add_column :line_items, :cart_id, :integer
    add_foreign_key :line_items, :carts, column: :cart_id

    add_index :line_items, %i[product_id cart_id], unique: true

    change_column :line_items, :quantity, :integer, default: 1
  end
end
