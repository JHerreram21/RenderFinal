class AddEstadoToSolicituds < ActiveRecord::Migration[7.0]
  def change
    add_column :solicituds, :estado, :string
  end
end
