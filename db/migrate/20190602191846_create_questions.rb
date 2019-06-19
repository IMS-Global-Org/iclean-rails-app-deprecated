class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :text
      t.string :hint

      t.belongs_to :exam
      t.references :questionable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
