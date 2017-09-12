require 'rails_helper'

RSpec.describe Anteproyecto, type: :model do
  before {
    @attributes = { # Atributos válidos
                   fk_id_proyecto_b: "1",
                   fk_numControl: "11161075",
                   nombre_anteproy: "SIDCITO",
                   asesor_externo: "Jorge Agustín Zárate Pérez",
                   status_anteproy: "Aprobado"
                  }
  }
  
    context 'model' do
      it 'exist' do
        anteproy = Anteproyecto.new
        expect(anteproy).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        anteproy = Anteproyecto.new @attributes
        expect(anteproy).to be_valid
      end
      
      it 'is valid if belongs to :banco_proyecto' do
        asociacion = Anteproyecto.reflect_on_association(:banco_proyecto)
        expect(asociacion.macro).to be(:belongs_to)
      end
      
      it 'is valid if has many :estudiantes' do
        asociacion = Anteproyecto.reflect_on_association(:estudiantes)
        expect(asociacion.macro).to be(:has_many)
      end
      
      it 'is valid if has one :revisa_anteproyecto' do
        asociacion = Anteproyecto.reflect_on_association(:revisa_anteproyecto)
        expect(asociacion.macro).to be(:has_one)
      end
      
      it 'is valid if has one :proyecto' do
        asociacion = Anteproyecto.reflect_on_association(:proyecto)
        expect(asociacion.macro).to be(:has_one)
      end
      
      # -------------------------------------------------------------
      
      describe '#fk_id_proyecto_b' do
        context 'with invalid data' do
          it 'refuses id_proyecto_b (en blanco)' do
            @attributes.merge!(fk_id_proyecto_b: '')
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
          
          it 'refuses id_proyecto_b (con caracter inválido)' do
            @attributes.merge!(fk_id_proyecto_b: '1116107a')
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
        end # invalid id_proyecto_b
      end # id_proyecto_b description
     
      # -------------------------------------------------------------
      
      describe '#fk_numControl' do
        context 'with invalid data' do
          it 'refuses numControl (en blanco)' do
            @attributes.merge!(fk_numControl: '')
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
          
          it 'refuses numControl (con menos de 8 caracteres)' do
            @attributes.merge!(fk_numControl: '1116107')
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
          
          it 'refuses numControl (con más de 9 caracteres)' do
            @attributes.merge!(fk_numControl: '1116107512')
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
          
          it 'refuses numControl (con caracter inválido)' do
            @attributes.merge!(fk_numControl: '1116107a')
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
        end # invalid fk_numControl
      end # fk_numControl description
      
      # -------------------------------------------------------------
      
      describe '#nombre_anteproy' do
        context 'with invalid data' do
          it 'refuses nombre_anteproy (en blanco)' do
            @attributes.merge!(nombre_anteproy: '')
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
          
          it 'refuses nombre_anteproy (con más de 250 caracteres)' do
            @attributes.merge!(nombre_anteproy: '.' * 251)
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
        end # invalid nombre_anteproy
      end # nombre_anteproy description
      
      # -------------------------------------------------------------
      
      describe '#asesor_externo' do
        context 'with invalid data' do
          it 'refuses asesor_externo (en blanco)' do
            @attributes.merge!(asesor_externo: '')
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
          
          it 'refuses asesor_externo (con más de 100 caracteres)' do
            @attributes.merge!(asesor_externo: '.' * 101)
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
        end # invalid asesor_externo
      end # asesor_externo description
      # -------------------------------------------------------------
      
      describe '#status_anteproy' do
        context 'with invalid data' do
          it 'refuses status_anteproy (en blanco)' do
            @attributes.merge!(status_anteproy: '')
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
          
          it 'refuses status_anteproy (con más de 30 caracteres)' do
            @attributes.merge!(status_anteproy: '.' * 31)
            anteproy = Anteproyecto.new @attributes
            expect(anteproy).to be_invalid
          end
        end # invalid status_anteproy
      end # status_anteproy
    end # model context
end # Anteproyecto description
