class CreateCategorizations < ActiveRecord::Migration[6.0]
  def change
    create_table :categorizations do |t|
      t.integer :category_id
      t.integer :product_id

      t.timestamps
    end

    add_foreign_key :categorizations, :categories, column: :category_id
    add_foreign_key :categorizations, :products, column: :product_id
    add_index :categorizations, %i[category_id product_id], unique: true
  end
end
