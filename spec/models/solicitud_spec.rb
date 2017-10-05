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
    
    it 'is valid if belongs to :empresa' do
      relacion = Solicitud.reflect_on_association(:empresa)
      expect(relacion.macro).to be(:belongs_to)
    end
    
    it 'is valid if has many :banco_proyectos' do
      relacion = Solicitud.reflect_on_association(:banco_proyectos)
      expect(relacion.macro).to be(:has_many)
    end
    
    it 'is valid if has many :solicitud_observaciones' do
      relacion = Solicitud.reflect_on_association(:solicitud_observaciones)
      expect(relacion.macro).to be(:has_many)
    end
    
    # -------------------------------------------------------------
    
    describe '#nombre del proyecto' do
      context 'with valid data' do
        it 'accepts nombrep (con letras)' do
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_valid
        end
        
        it 'accepts nombrep (con una letra y un número)' do
          @attributes.merge!(nombrep: 'a1')
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_valid
        end
        
        it 'accepts nombrep (con una letra y diagonales [\ /])' do
          @attributes.merge!(nombrep: 'a\\/')
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_valid
        end
        
        it 'accepts nombrep (con una letra y signos de puntuación [. , ; : ¿ ? - _ \' " ¡! ()])' do
          @attributes.merge!(nombrep: 'a.,;:¿?-_\'"¡!()')
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_valid
        end
        
        it 'accepts nombrep (con 255 caracteres admitidos)' do
          @attributes.merge!(nombrep: 'a' * 255)
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_valid
        end
      end # valid nombrep
      
      context 'with invalid data' do
        it 'refuses nombrep (vacío)' do
          @attributes.merge!(nombrep: '')
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_invalid
        end
        
        it 'refuses nombrep (sin letra como caracter inicial)' do
          @attributes.merge!(nombrep: '1.')
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_invalid
        end
        
        it 'refuses nombrep (con caracteres no admitidos)' do
          @attributes.merge!(nombrep: '#$%&')
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_invalid
        end
        
        it 'refuses nombrep (con más de 255 caracteres admitidos)' do
          @attributes.merge!(nombrep: 'a' * 256)
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_invalid
        end
        
        it 'refuses nombrep (si el nombre de proyecto ya había sido registrado)' do
          @attributes.merge!(nombrep: 'a')
          solicitud = Solicitud.new @attributes
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_invalid
        end
      end # invalid nombrep
    end # nombrep description
    
    # -------------------------------------------------------------
    
    describe '#fecha de inicio' do
      context 'with valid data' do
        it 'accepts fechaini (en blanco)' do
          @attributes.merge!(fechaini: "")
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_valid
        end
        
        it 'accepts fechaini (con la fecha de hoy)' do
          @attributes.merge!(fechaini: Date.today.strftime('%d/%m/%Y'))
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_valid
        end
      end # valid fechaini
      
      context 'with invalid data' do
        it 'refuses fechaini (anterior a la fecha de hoy)' do
          @attributes.merge!(fechaini: Date.yesterday.strftime('%d/%m/%Y'))
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_invalid
        end
      end # invalid fechaini
    end # fechaini description
    
    # -------------------------------------------------------------
    
    describe '#fecha de termino' do
      context 'with valid data' do
        it 'accepts termino (en blanco)' do
          @attributes.merge!(fechater: "")
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_valid
        end
        
        it 'accepts fechater (con fecha de 4 meses a partir de fechaini)' do
          @attributes.merge!(fechaini: Date.today.strftime('%d/%m/%Y'))
          @attributes.merge!(fechater: 4.months.from_now.strftime('%d/%m/%Y'))
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_valid
        end
      end # valid fechater
      
      context 'with invalid data' do
        it 'accepts fechater (con fecha anterior a 4 meses a partir de fechaini)' do
          @attributes.merge!(fechaini: Date.today.strftime('%d/%m/%Y'))
          @attributes.merge!(fechater: 110.days.from_now.strftime('%d/%m/%Y'))
          solicitud = Solicitud.new @attributes
          expect(solicitud).to be_invalid
        end
      end # invalid fechater
    end # fechater description
end
