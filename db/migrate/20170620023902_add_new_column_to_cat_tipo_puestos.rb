class AddNewColumnToCatTipoPuestos < ActiveRecord::Migration
  def change
      add_column :cat_tipo_puestos, :alterno, :string
  end
end
