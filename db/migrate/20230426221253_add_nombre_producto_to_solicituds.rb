class AddNombreProductoToSolicituds < ActiveRecord::Migration[7.0]
  def change
    add_column :solicituds, :nombre_producto, :string
  end
end
