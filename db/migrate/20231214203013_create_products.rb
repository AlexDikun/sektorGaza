class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :body
      t.decimal :price
      t.text :image_data

      t.timestamps
    end
  end
end
