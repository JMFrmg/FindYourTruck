class AddCityToStreets < ActiveRecord::Migration[5.1]
  def change
    add_column :streets, :city, :string
  end
end
