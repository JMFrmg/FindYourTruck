class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :composition
      t.float :price
      t.references :menu, foreign_key: true
    end
  end
end
