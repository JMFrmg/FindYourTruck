class AddPostalcodeToStreets < ActiveRecord::Migration[5.1]
  def change
    add_column :streets, :postalcode, :integer
  end
end
