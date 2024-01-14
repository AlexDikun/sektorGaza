class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fullname
      t.text :avatar_data

      t.timestamps
    end
  end
end
