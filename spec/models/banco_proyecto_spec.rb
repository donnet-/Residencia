require 'spec_helper'

describe 'BancoProyecto' do
  before {
    @attributes = { # Atributos válidos
                   fk_rfc_emp_inst: 'AAAA111111AAA',
                   nombre_proyecto_b: 'SIDSCITO',
                   descrip_proyecto_b: 'Descripción',
                   tipo_proyecto_b: 'Tipo',
                   fecha_inicio_proyecto_b: Date.tomorrow,
                   fecha_termino_proyecto_b: 10.days.from_now,
                   num_residentes: 2,
                   objetivo_esperado: 'Objetivo',
                   pdf_solicitud: 'ruta/solicitud.pdf'}
  }
    
  context 'model' do
    it 'exist' do
      banco = BancoProyecto.new
      expect(banco).to_not be_nil
    end
    
    it 'is valid with all the attributes' do
      banco = BancoProyecto.new @attributes
      expect(banco).to be_valid
    end
    
    it 'is valid if belongs to :empresa' do
      relacion = BancoProyecto.reflect_on_association(:empresa)
      expect(relacion.macro).to be(:belongs_to)
    end
    
    it 'is valid if has many :anteproyectos' do
      relacion = BancoProyecto.reflect_on_association(:anteproyectos)
      expect(relacion.macro).to be(:has_many)
    end
    
    # -------------------------------------------------------------
    
    describe '#fk_rfc_emp_inst' do
      context 'with valid data' do
        it 'accepts rfc (completo)' do
          banco = BancoProyecto.new @attributes
          expect(banco).to be_valid
        end
        
        it 'accepts rfc (con 3 caracteres para el nombre)' do
          @attributes.merge!(fk_rfc_emp_inst: 'AAA111111AAA')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_valid
        end
        
        it 'accepts rfc (sin homoclave)' do
          @attributes.merge!(fk_rfc_emp_inst: 'AAAA111111')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_valid
        end
        
        it 'accepts rfc (sin homoclave y con 3 caracteres para el nombre)' do
          @attributes.merge!(fk_rfc_emp_inst: 'AAA111111')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_valid
        end
        
        it 'accepts rfc (datos de nombre con Ñ)' do
          @attributes.merge!(fk_rfc_emp_inst: 'ÑAAA111111AAA')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_valid
        end
        
        it 'accepts rfc (datos de nombre con &)' do
          @attributes.merge!(fk_rfc_emp_inst: 'A&A111111AAA')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_valid
        end
      end # valid rfc
      
      context 'with invalid data' do
        it 'refuses blank rfc' do
          @attributes.merge!(fk_rfc_emp_inst: '')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses rfc (nombre con dígito en lugar de letra)' do
          @attributes.merge!(fk_rfc_emp_inst: '9AAA111111')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses rfc (con caracter inválido)' do
          @attributes.merge!(fk_rfc_emp_inst: 'A*AA111111')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses rfc (falta un dígito en la fecha)' do
          @attributes.merge!(fk_rfc_emp_inst: 'AAAA11111')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses rfc (falta un caracter en los datos del nombre)' do
          @attributes.merge!(fk_rfc_emp_inst: 'AA111111')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses rfc (el día 42 es inválido)' do
          @attributes.merge!(fk_rfc_emp_inst: 'AAAA111142')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses rfc (el mes 25 es inváido)' do
          @attributes.merge!(fk_rfc_emp_inst: 'AAAA112511')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
      end # invalid rfc
    end # rfc description
    
    # -------------------------------------------------------------
    
    describe '#nombre_proyecto_b' do
      context 'with invalid data' do
        it 'refuses nombre_proyecto (en blanco)' do
          @attributes.merge!(nombre_proyecto_b: '')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses nombre_proyecto_b (con más de 250 caracteres)' do
          @attributes.merge!(nombre_proyecto_b: 'a' * 251)
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
      end # invalid nombre_proyecto
    end # nombre_proyecto description
    
    # -------------------------------------------------------------
    
    describe '#descrip_proyecto_b' do
      context 'with invalid data' do
        it 'refuses descripcion_proyecto (en blanco)' do
          @attributes.merge!(descrip_proyecto_b: '')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end # invalid descripcion_proyecto
        
        it 'refuses descripcion_proyecto (con más de 500 caracteres)' do
          @attributes.merge!(descrip_proyecto_b: 'a' * 501)
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
      end # invalid descripcion_proyecto
    end # descripcion_proyecto description
    
    # -------------------------------------------------------------
    
    describe '#tipo_proyecto_b' do
      context 'with invalid data' do
        it 'refuses tipo_proyecto (en blanco)' do
          @attributes.merge!(tipo_proyecto_b: '')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses tipo_proyecto (con más de 30 caracteres)' do
          @attributes.merge!(tipo_proyecto_b: 'a' * 31)
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
      end # invalid tipo_proyecto
    end # tipo_proyecto description
    
    # -------------------------------------------------------------
    
    describe '#fecha_inicio_proyecto_b' do
      context 'with invalid data' do
        it 'refuses fecha_inicio (en blanco)' do
          @attributes.merge!(fecha_inicio_proyecto_b: '')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses fecha_inicio (con caracter inválido)' do
          @attributes.merge!(fecha_inicio_proyecto_b: '2017-02-0a')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses fecha_inicio (anterior al día en curso)' do
          @attributes.merge!(fecha_inicio_proyecto_b: Date.yesterday)
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
      end # invalid fecha_inicio
    end # fecha_inicio description
    
    # -------------------------------------------------------------
    
    describe '#fecha_termino_proyecto_b' do
      context 'with invalid data' do
        it 'refuses fecha_termino (en blanco)' do
          @attributes.merge!(fecha_termino_proyecto_b: '')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses fecha_termino (con caracter inválido)' do
          @attributes.merge!(fecha_termino_proyecto_b: '2017-03-ab')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses fecha_termino (anterior a fecha_inicio)' do
          @attributes.merge!(fecha_inicio_proyecto_b: Date.tomorrow)
          @attributes.merge!(fecha_termino_proyecto_b: Date.today)
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
      end # invalid fecha_termino
    end # fecha_termino description
    
    # -------------------------------------------------------------
    
    describe '#num_residentes' do
      context 'with invalid data' do
        it 'refuses num_residentes (en blanco)' do
          @attributes.merge!(num_residentes: '')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses num_residentes (con caracter inválido)' do
          @attributes.merge!(num_residentes: '1a')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses num_residentes (con más de dos dígitos)' do
          @attributes.merge!(num_residentes: 123)
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
      end # invalid num_residentes
    end # num_residentes description
    
    # -------------------------------------------------------------
    
    describe '#objetivo_esperado' do
      context 'with invalid data' do
        it 'refuses objetivo_esperado (en blanco)' do
          @attributes.merge!(objetivo_esperado: '')
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
        
        it 'refuses objetivo_esperado (con más de 500 caracteres)' do
          @attributes.merge!(objetivo_esperado: 'a' * 501)
          banco = BancoProyecto.new @attributes
          expect(banco).to be_invalid
        end
      end # invalid objetivo_esperado
    end # objetivo_esperado description
    
    # -------------------------------------------------------------
    
    it '#pdf_solicitud with invalid data refuses pdf_solicitud (en blanco)' do
      @attributes.merge!(pdf_solicitud: '')
      banco = BancoProyecto.new @attributes
      expect(banco).to be_invalid
    end
  end # model context
end
