class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.float :price
      t.references :menu, foreign_key: true
    end
  end
end
