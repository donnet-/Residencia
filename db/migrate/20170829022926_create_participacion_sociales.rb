class CreateParticipacionSociales < ActiveRecord::Migration
  def change
    create_table :participacion_sociales do |t|
      t.string :organizacion_social
      t.string :organismo_profesionistas
      t.string :asociacion_egresados
      t.string :describir

      t.timestamps null: false
    end
  end
end
