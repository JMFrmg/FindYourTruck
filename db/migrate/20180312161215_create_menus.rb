class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name, default: "Menu non communiqué"
      t.string :picture
      t.references :foodtrucker, foreign_key: true
    end
  end
end
