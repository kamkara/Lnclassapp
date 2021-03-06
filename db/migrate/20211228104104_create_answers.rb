class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers, id: :uuid do |t|
      t.text :content
      t.boolean :correct_answer
      t.references :question, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
