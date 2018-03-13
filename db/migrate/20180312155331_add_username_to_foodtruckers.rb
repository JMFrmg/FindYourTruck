class AddUsernameToFoodtruckers < ActiveRecord::Migration[5.1]
  def change
    add_column :foodtruckers, :username, :string
  end
end
