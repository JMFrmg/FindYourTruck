class AddAvatarsToFoodtruckers < ActiveRecord::Migration[5.1]
  def up
    add_attachment :foodtruckers, :avatar
  end

  def down
    remove_attachment :foodtruckers, :avatar
  end
end
