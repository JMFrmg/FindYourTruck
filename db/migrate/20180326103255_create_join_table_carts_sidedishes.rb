class CreateJoinTableCartsSidedishes < ActiveRecord::Migration[5.1]
  def change
    create_join_table :carts, :sidedishes do |t|
      t.index [:cart_id, :sidedish_id]
      t.index [:sidedish_id, :cart_id]
    end
  end
end
