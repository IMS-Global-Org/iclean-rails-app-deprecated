class CreateUserExams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_exams do |t|

      t.timestamps
    end
  end
end
