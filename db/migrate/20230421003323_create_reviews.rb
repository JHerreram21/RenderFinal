class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true
      t.string :user_name
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
