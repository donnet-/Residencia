class AddColumnToTableDocentes < ActiveRecord::Migration
  def change
      add_column :docentes, :rol, :string, default: 'docente'
      add_column :docentes, :pdfCurriculum, :string
  end
end
