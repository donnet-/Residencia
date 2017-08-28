class ChangeColumnToCatMateria < ActiveRecord::Migration
  def change
      change_column :cat_materias, :credito, :string
  end
end
