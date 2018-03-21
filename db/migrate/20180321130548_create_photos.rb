class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
    	t.references :foodtrucker, foreign_key: true
    end
  end
end
