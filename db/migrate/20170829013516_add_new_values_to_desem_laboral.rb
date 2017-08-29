class AddNewValuesToDesemLaboral < ActiveRecord::Migration
  def change
    add_column :desem_laborales, :competencia_laboral, :integer
  end
end
