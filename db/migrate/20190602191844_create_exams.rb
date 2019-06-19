class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :title
      t.text :description
      t.string :icon, limit: 20

      t.timestamps
    end
  end
end
