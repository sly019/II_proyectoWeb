class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :descripcion
      t.string :estado

      t.timestamps null: false
    end
  end
end
