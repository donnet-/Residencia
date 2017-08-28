class AddNewColumnAnexToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :anexo_id, :integer
  end
end
