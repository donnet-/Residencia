class AddRevisorToAnteproyectos < ActiveRecord::Migration
  def change
    add_column :anteproyectos, :revisor, :string
  end
end
