class CreateSolicitudObservaciones < ActiveRecord::Migration
  def change
    create_table :solicitud_observaciones do |t|
      t.string :rfc
      t.text :observacion
      t.references :solicitud, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
