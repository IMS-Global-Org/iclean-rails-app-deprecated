class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :country

      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
