class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :user_name, null: false
      t.datetime :created_at, null: false
    end
  end
end
