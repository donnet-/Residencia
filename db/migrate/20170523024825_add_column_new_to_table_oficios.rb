class AddColumnNewToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :cuota, :string
      add_column :oficios, :importe, :string
      add_column :oficios, :motivo, :string
      add_column :oficios, :lugar, :string
      add_column :oficios, :nacionall, :boolean
      add_column :oficios, :anticipado, :boolean
      add_column :oficios, :devengado, :boolean
      add_column :oficios, :nivelAp, :string
      add_column :oficios, :zonaMaE, :boolean
      add_column :oficios, :zonaMeE, :boolean
  end
end
