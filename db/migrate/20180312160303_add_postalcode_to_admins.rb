class AddPostalcodeToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :postalcode, :integer
  end
end
