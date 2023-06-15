class CreateSolicituds < ActiveRecord::Migration[7.0]
  def change
    create_table :solicituds do |t|
      t.string :nombre
      t.string :email
      t.integer :product_id

      t.timestamps
    end
  end
end
