require 'spec_helper'

RSpec.describe Solicitud, type: :model do
  before {
    @attributes = { # Atributos válidos
                   nombrep: 'SIDSCITO',
                   fechaini: '01/01/2018',
                   fechater: '01/06/2018',
                   aexterno: 'L.I. Jorge Zárate Pérez',
                   telefono: '9511234567',
                   extension: '1234',
                   correo: 'correo@gmail.com',
                   area: 'Sistemas',
                   numresidentes: 2,
                   carrera: 'Ing. en Sistemas Computacionales',
                   semestre: 8,
                   ingles: 'no',
                   horaentrada: '08:00',
                   horasalida: '14:00',
                   desproyecto: 'Descripción del proyecto',
                   objetivo: 'Objetivo del proyecto',
                   actividades: 'Actividades del proyecto',
                   pc: 'no',
                   tel_escritorio: '1234567',
                   lugar: 'no',
                   beca: 0,
                   observacion: 'Observaciones del proyecto',
                   estado: 'En revisión',
                   rfc: 'CBI981002976'
                   }
  }
    context 'model' do
      it 'exist' do
        solicitud = Solicitud.new
        expect(solicitud).to_not be_nil
      end
    end
    
    it 'is valid with all the attributes' do
      solicitud = Solicitud.new @attributes
      expect(solicitud).to be_valid
    end
    
    xit 'is valid if belongs to :empresa' do
      relacion = Solicitud.reflect_on_association(:empresa)
      expect(relacion.macro).to be(:belongs_to)
    end
    
    xit 'is valid if has many :anteproyectos' do
      relacion = Solicitud.reflect_on_association(:banco_proyectos)
      expect(relacion.macro).to be(:has_many)
    end
    
    # -------------------------------------------------------------
end
