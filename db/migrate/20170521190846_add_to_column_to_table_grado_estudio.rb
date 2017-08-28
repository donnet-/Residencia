class AddToColumnToTableGradoEstudio < ActiveRecord::Migration
  def change
      add_column :grado_estudios, :abrev, :string
  end
end
