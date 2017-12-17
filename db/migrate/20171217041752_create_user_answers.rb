class CreateUserAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_answers do |t|
      t.integer :question_id
      t.string :user_name
      t.text :answer

      t.timestamps
    end
  end
end
