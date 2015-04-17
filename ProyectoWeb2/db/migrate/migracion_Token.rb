class AddTokenToUsers < ActiveRecord::Migration
  def self.up
      change_table(:users) do |t|
          # Token authenticatable
          t.string :authentication_token
      end
      
      add_index :users, :authentication_token, :unique => true
  end

  def self.down
      raise ActiveRecord::IrreversibleMigration
  end
end