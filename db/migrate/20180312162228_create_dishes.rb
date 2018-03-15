class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.references :menu, foreign_key: true
      t.string :name
      t.string :composition
      t.float :price
    end
  end
end
