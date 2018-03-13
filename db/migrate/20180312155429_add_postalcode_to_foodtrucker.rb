class AddPostalcodeToFoodtrucker < ActiveRecord::Migration[5.1]
  def change
    add_column :foodtruckers, :postalcode, :integer
  end
end
