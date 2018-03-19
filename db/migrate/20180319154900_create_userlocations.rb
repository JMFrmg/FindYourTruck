class CreateUserlocations < ActiveRecord::Migration[5.1]
  def change
    create_table :userlocations do |t|
      t.string :ip
      t.float :latitude
      t.float :longitude
    end
  end
end
