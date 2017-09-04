require 'spec_helper'

describe 'Empleo' do
  before { 
    @attributes = { # Atributos válidos
                   fk_rfc_emp_inst: "AAAA111111AAA",
                   fk_numControl: 11161075,
                   f_inicial_empleo: "2017-03-27",
                   f_final_empleo: "2017-03-30",
                   nivel_jerarquico: "Jefe",
                   condicion_trabajo: "Contrato",
                   relacion_area_formacion: "100"}
  }
    
    context 'model' do
      it 'exist' do
        empleo = Empleo.new
        expect(empleo).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        empleo = Empleo.new @attributes
        expect(empleo).to be_valid
      end
      
      it 'is valid if belongs to :empresa' do
	relacion = Empleo.reflect_on_association(:empresa)
	expect(relacion.macro).to be(:belongs_to)
      end
      
      it 'is valid if has many :extranjero_idiomas' do
	relacion = Empleo.reflect_on_association(:extranjero_idiomas)
	expect(relacion.macro).to be(:has_many)
      end
      
      it 'is valid if has many :satisfaccion_empleo_criterios' do
	relacion = Empleo.reflect_on_association(:satisfaccion_empleo_criterios)
	expect(relacion.macro).to be(:has_many)
      end
      
      it 'is valid if belongs to :datos_egresado' do
	relacion = Empleo.reflect_on_association(:datos_egresado)
	expect(relacion.macro).to be(:belongs_to)
      end
      
      # -------------------------------------------------------------
      
      describe '#fk_rfc_emp_inst' do
        context 'with valid data' do
          it 'accepts rfc (completo)' do
            # El rfc válido está en @valids_attrs
            empleo = Empleo.new @attributes
            expect(empleo).to be_valid
          end
          
          it 'accepts rfc (con 3 caracteres para el nombre)' do
            @attributes.merge!(fk_rfc_emp_inst: 'AAA111111AAA')
            empleo = Empleo.new @attributes
            expect(empleo).to be_valid
          end
          
          it 'accepts rfc (sin homoclave)' do
            @attributes.merge!(fk_rfc_emp_inst: 'AAAA111111')
            empleo = Empleo.new @attributes
            expect(empleo).to be_valid
          end
          
          it 'accepts rfc (sin homoclave y con 3 caracteres para el nombre)' do
            @attributes.merge!(fk_rfc_emp_inst: 'AAA111111')
            empleo = Empleo.new @attributes
            expect(empleo).to be_valid
          end
          
          it 'accepts rfc (datos de nombre con Ñ)' do
            @attributes.merge!(fk_rfc_emp_inst: 'ÑAAA111111AAA')
            empleo = Empleo.new @attributes
            expect(empleo).to be_valid
          end
          
          it 'accepts rfc (datos de nombre con &)' do
            @attributes.merge!(fk_rfc_emp_inst: 'A&A111111AAA')
            empleo = Empleo.new @attributes
            expect(empleo).to be_valid
          end
        end # valid rfc
        
        context 'with invalid data' do
          it 'refuses blank rfc' do
            @attributes.merge!(fk_rfc_emp_inst: '')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'Refuses rfc (nombre con dígito en lugar de letra)' do
            @attributes.merge!(fk_rfc_emp_inst: '9AAA111111')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses rfc (con caracter inválido)' do
            @attributes.merge!(fk_rfc_emp_inst: 'A*AA111111')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses rfc (falta un dígito en la fecha)' do
            @attributes.merge!(fk_rfc_emp_inst: 'AAAA11111')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses rfc (falta un caracter en los datos del nombre)' do
            @attributes.merge!(fk_rfc_emp_inst: 'AA111111')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses rfc (el día 42 es inválido)' do
            @attributes.merge!(fk_rfc_emp_inst: 'AAAA111142')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses rfc (el mes 25 es inváido)' do
            @attributes.merge!(fk_rfc_emp_inst: 'AAAA112511')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
        end # invalid rfc
      end # rfc description
      
      # -------------------------------------------------------------
      
      describe '#fk_numControl' do
        context 'with invalid data' do
          it 'refuses numControl (en blanco)' do
            @attributes.merge!(fk_numControl: '')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses numControl (con menos de 8 caracteres)' do
            @attributes.merge!(fk_numControl: '1116107')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses numControl (con más de 9 caracteres)' do
            @attributes.merge!(fk_numControl: '1116107512')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses numControl (con caracter inválido)' do
            @attributes.merge!(fk_numControl: '1116107a')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
        end # invalid numControl
      end # numControl description
      
      # -------------------------------------------------------------
      
      describe '#f_inicial_empleo' do
        context 'with invalid data' do
          it 'refuses f_inicial (en blanco)' do
            @attributes.merge!(f_inicial_empleo: '')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses f_inicial (con caracter inválido)' do
            @attributes.merge!(f_inicial_empleo: '2017-03-ab')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses f_inicial (anterior a 2009-01-01)' do
            # 2009 es el año en que inició su curso la primera generación de ISC
            @attributes.merge!(f_inicial_empleo: '2008-12-31')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses f_inicial (después de 15 días desde hoy)' do
            @attributes.merge!(f_inicial_empleo: 16.days.from_now)
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
        end # invalid f_inicial
      end # f_inicial description
      
      # -------------------------------------------------------------
      
      describe '#f_final_empleo' do
        context 'with valid data' do
          it 'accepts f_final (en blanco)' do
            @attributes.merge!(f_final_empleo: '')
            empleo = Empleo.new @attributes
            expect(empleo).to be_valid
          end
        end # valid f_final
        
        context 'with invalid data' do
          it 'refuses f_final (con caracter inválido)' do
            @attributes.merge!(f_final_empleo: '2017-03-ab')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses f_final (anterior a f_inicial)' do
            @attributes.merge!(f_inicial_empleo: '2017-04-04')
            @attributes.merge!(f_final_empleo: '2017-04-03')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses f_final (posterior a 30 días de la fecha actual)' do
            @attributes.merge!(f_final_empleo: 31.days.from_now)
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
        end # invalid f_final
      end # f_final description
      
      # -------------------------------------------------------------
      
      describe '#nivel_jerarquico' do
        context 'with invalid data' do
          it 'refuses nivel_jerarquico (en blanco)' do
            @attributes.merge!(nivel_jerarquico: '')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses nivel_jerarquico (con más de 100 caracteres)' do
            @attributes.merge!(nivel_jerarquico: 'Director General de Educación Superior Tecnológica Director General de Educación Superior Tecnológica')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
        end # invalid nivel_jerarquico
      end # nivel_jerarquico description
      
      # -------------------------------------------------------------
      
      describe '#condicion_trabajo' do
        context 'with invalid data' do
          it 'refuses condicion_trabajo (en blanco)' do
            @attributes.merge!(condicion_trabajo: '')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses condicion_trabajo (con más de 30 caracteres)' do
            @attributes.merge!(condicion_trabajo: 'Contrato Base Eventual Eventual Contrato Otro')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
        end # invalid condicion_trabajo 
      end # condicion_trabajo description
      
      # -------------------------------------------------------------
      
      describe '#relacion_area_formacion' do
        context 'with invalid data' do
          it 'refuses relacion_area_formacion (en blanco)' do
            @attributes.merge!(relacion_area_formacion: '')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses relacion_area_formacion (con más de 3 caracteres)' do
            @attributes.merge!(relacion_area_formacion: '2000')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
          
          it 'refuses relacion_area_formacion (con caracter inváido)' do
            @attributes.merge!(relacion_area_formacion: '200a')
            empleo = Empleo.new @attributes
            expect(empleo).to be_invalid
          end
        end # invalid relacion_area_formacion
      end # relacion_area_formacion description
    end # model context
  end
  
