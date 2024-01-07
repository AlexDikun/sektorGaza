class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fullname
      # t.string :email
      t.text :avatar_data
      # t.string :encrypted_password

      t.timestamps
    end
  end
end
