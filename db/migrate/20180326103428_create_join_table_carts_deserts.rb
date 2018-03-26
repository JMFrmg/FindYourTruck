class CreateJoinTableCartsDeserts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :carts, :deserts do |t|
       t.index [:cart_id, :desert_id]
       t.index [:desert_id, :cart_id]
    end
  end
end
