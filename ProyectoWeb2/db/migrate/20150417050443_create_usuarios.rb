class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :username
      t.string :password_hast
      t.string :password_salt
      t.string :token

      t.timestamps null: false
    end
  end
end
