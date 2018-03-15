class CreateJoinTableCartsDishes < ActiveRecord::Migration[5.1]
  def change
    create_join_table :carts, :dishes do |t|
       t.index [:cart_id, :dish_id]
       t.index [:dish_id, :cart_id]
    end
  end
end
