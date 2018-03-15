class AddActualToStreets < ActiveRecord::Migration[5.1]
  def change
    add_column :streets, :actual, :boolean
  end
end
