class RemoveNewColumnToTableOficios < ActiveRecord::Migration
  def change
      remove_column :oficios, :zonaMaE, :boolean
      remove_column :oficios, :zonaMeE, :boolean
      remove_column :oficios, :devengado, :boolean
      remove_column :oficios, :anticipado, :boolean
  end
end
