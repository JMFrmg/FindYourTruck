class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.references :foodtrucker, foreign_key: true
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
