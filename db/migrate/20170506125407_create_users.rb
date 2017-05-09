class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.boolean :is_superuser
      t.boolean :is_admin

      t.timestamps
    end
  end
end
