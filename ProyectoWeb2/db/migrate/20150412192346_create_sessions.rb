class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :username
      t.string :token
      t.date :date

      t.timestamps null: false
    end
  end
end
