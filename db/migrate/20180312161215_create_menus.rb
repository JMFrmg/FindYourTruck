class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :picture
      t.references :foodtrucker, foreign_key: true
    end
  end
end
