require 'spec_helper'

describe 'Estudio' do
  before {
    @attributes = { # Atributos válidos
                   fk_numControl: 11161075,
                   instituto_estudio: "ITO",
                   estudio: "Estudio",
                   grado_estudio: 2,
                   especialidad_estudio: "Especialidad",
                   f_inicial_estudio: Date.tomorrow,
                   f_final_estudio: 180.days.from_now
                  }
  }
    
    context 'model' do
      it 'exist' do
        estudio = Estudio.new
        expect(estudio).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        estudio = Estudio.new @attributes
        expect(estudio).to be_valid
      end
      
      it 'is valid if belongs to :datos_egresado' do
        asociacion = Estudio.reflect_on_association(:datos_egresado)
	expect(asociacion.macro).to be(:belongs_to)
      end
      
      # -------------------------------------------------------------
      
      describe '#fk_numControl' do
        context 'with invalid data' do
          it 'refuses numControl (en blanco)' do
            @attributes.merge!(fk_numControl: '')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses numControl (con menos de 8 caracteres)' do
            @attributes.merge!(fk_numControl: '1116107')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses numControl (con más de 9 caracteres)' do
            @attributes.merge!(fk_numControl: '1116107512')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses numControl (con caracter inválido)' do
            @attributes.merge!(fk_numControl: '1116107a')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
        end # invalid numControl
      end # numControl description
      
      # -------------------------------------------------------------
      
      describe '#instituto_estudio' do
        context 'with invalid data' do
          it 'refuses instituto (en blanco)' do
            @attributes.merge!(instituto_estudio: '')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses instituto (con más de 50 caracteres)' do
            @attributes.merge!(instituto_estudio: '.' * 51)
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
        end # invalid instituto
      end # instituto description
      
      # -------------------------------------------------------------
      
      describe '#estudio' do
        context 'with invalid data' do
          it 'refuses estudio (en blanco)' do
            @attributes.merge!(estudio: '')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses estudio (con más de 50 caracteres)' do
            @attributes.merge!(estudio: '.' * 51)
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
        end # invalid estudio
      end # estudio description
      
      # -------------------------------------------------------------
      
      describe '#grado_estudio' do
        context 'with invalid data' do
          it 'refuses grado (con caracter inválido)' do
            @attributes.merge!(grado_estudio: '1a')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses grado (mayor a 20)' do
            @attributes.merge!(grado_estudio: 21)
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
        end # invalid grado
      end # grado description
      
      # -------------------------------------------------------------
      
      describe '#especialidad_estudio' do
        it 'with invalid data, refuses especialidad (con más de 50 caracteres)' do
          @attributes.merge!(especialidad_estudio: '.' * 51)
          estudio = Estudio.new @attributes
          expect(estudio).to be_invalid
        end 
      end # especialidad description
      
      # -------------------------------------------------------------
      
      describe 'f_inicial_estudio' do
        context 'with invalid data' do
          it 'refuses f_inicial (en blanco)' do
            @attributes.merge!(f_inicial_estudio: '')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses f_inicial (con caracter inválido)' do
            @attributes.merge!(f_inicial_estudio: '2017-03-ab')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses f_inicial (anterior a 2009-01-01)' do
            # 2009 es el año en que inició su curso la primera generación de ISC
            @attributes.merge!(f_inicial_estudio: '2008-12-31')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses f_inicial (después de 60 días desde El día en curso)' do
            @attributes.merge!(f_inicial_estudio: 61.days.from_now)
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
        end # invalid f_inicial
      end # f_inicial description
      
      # -------------------------------------------------------------
      
      describe '#f_final_estudio' do
        context 'with valid data' do
          it 'accepts f_final (en blanco)' do
            @attributes.merge!(f_final_estudio: '')
            estudio = Estudio.new @attributes
            expect(estudio).to be_valid
          end
        end # valid f_final
        
        context 'with invalid data' do
          it 'refuses f_final (con caracter inválido)' do
            @attributes.merge!(f_final_estudio: '2017-03-ab')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses f_final (anterior a f_inicial)' do
            @attributes.merge!(f_inicial_estudio: '2017-04-04')
            @attributes.merge!(f_final_estudio: '2017-04-03')
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
          
          it 'refuses f_final (posterior a 6 meses de la fecha actual)' do
            @attributes.merge!(f_final_estudio: 181.days.from_now)
            estudio = Estudio.new @attributes
            expect(estudio).to be_invalid
          end
        end # invalid f_final
      end # f_final description
    end
  end
