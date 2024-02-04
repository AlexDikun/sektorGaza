class AddIndexToReviews < ActiveRecord::Migration[6.0]
  def change
    add_index :reviews, %i[user_id product_id], unique: true
  end
end
