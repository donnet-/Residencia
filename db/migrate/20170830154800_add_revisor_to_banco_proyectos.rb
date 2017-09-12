class AddRevisorToBancoProyectos < ActiveRecord::Migration
  def change
    add_column :banco_proyectos, :revisor, :string
  end
end
