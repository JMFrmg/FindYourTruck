class CreateJoinTableCartsDrinks < ActiveRecord::Migration[5.1]
  def change
    create_join_table :carts, :drinks do |t|
       t.index [:cart_id, :drink_id]
       t.index [:drink_id, :cart_id]
    end
  end
end
