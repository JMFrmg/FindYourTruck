class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :link
      t.references :foodtrucker, foreign_key: true
    end
  end
end
