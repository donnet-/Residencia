class CreateConvenioHonorarios < ActiveRecord::Migration
  def change
    create_table :convenio_honorarios do |t|
      t.string :pdfConvenio
      t.date :fechaInicio
      t.date :fechaTermino
      t.references :docente, index: true, foreign_key: true
      t.integer :usuario_id
      t.string :estado

      t.timestamps null: false
    end
  end
end
