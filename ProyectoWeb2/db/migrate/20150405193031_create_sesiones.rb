class CreateSesiones < ActiveRecord::Migration
  def change
    create_table :sesiones do |t|
      t.string :user
      t.string :token
      t.date :date_create

      t.timestamps null: false
    end
  end
end
