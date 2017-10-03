class AddPdfAnteproyToAnteproyectos < ActiveRecord::Migration
  def change
    add_column :anteproyectos, :pdf_anteproy, :string
  end
end
