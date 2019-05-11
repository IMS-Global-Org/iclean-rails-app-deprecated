class RenameStreetNamesToSnakeCase < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :street1, :street_1
    rename_column :addresses, :street2, :street_2
  end
end
