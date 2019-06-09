class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.belongs_to :question, foreign_key: true
      t.string :text
      t.integer :answer_type
      t.references :answerable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
