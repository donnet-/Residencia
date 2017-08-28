class NewAddColumnFpDoModToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :modulo, :integer
      add_column :oficios, :docente, :integer
      add_column :oficios, :fechaPosterior, :date
  end
end
