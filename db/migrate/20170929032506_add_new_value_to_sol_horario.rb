class AddNewValueToSolHorario < ActiveRecord::Migration
  def change
    add_reference :sol_horarios, :solicitud, index: true, foreign_key: true
  end
end
