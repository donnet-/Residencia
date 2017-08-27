class AddColumnToTableEstudiante < ActiveRecord::Migration
  def change
      add_column :estudiantes, :rol, :string, default: 'estudiante'
      add_column :estudiantes, :email_adicional, :string
  end
end
