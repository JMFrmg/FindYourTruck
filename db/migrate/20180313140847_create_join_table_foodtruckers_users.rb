class CreateJoinTableFoodtruckersUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :foodtruckers, :users do |t|
       t.index [:foodtrucker_id, :user_id]
       t.index [:user_id, :foodtrucker_id]
    end
  end
end
