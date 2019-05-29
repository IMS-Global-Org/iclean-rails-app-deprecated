class CreateDemographics < ActiveRecord::Migration[5.2]
  def change
    create_table :demographics do |t|
      t.integer :age
      t.integer :gender
      t.integer :ethnicity
      t.integer :race

      t.timestamps
    end
  end
end
