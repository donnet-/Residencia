class AddStatusAnteproyRevisorToAnteproyectos < ActiveRecord::Migration
  def change
    add_column :anteproyectos, :status_anteproy_revisor, :string
  end
end
