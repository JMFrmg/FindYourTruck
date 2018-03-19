class CreateDeserts < ActiveRecord::Migration[5.1]
  def change
    create_table :deserts do |t|
      t.string :name
      t.string :description
      t.float :price
      t.references :menu, foreign_key: true
    end
  end
end
