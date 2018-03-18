class CreateStreets < ActiveRecord::Migration[5.1]
  def change
    create_table :streets do |t|
      t.string :address
      t.integer :postalcode
      t.string :city
      t.float :latitude
      t.float :longitude
      t.boolean :actual, default: "false"
      t.references :foodtrucker, foreign_key: true
    end
  end
end
