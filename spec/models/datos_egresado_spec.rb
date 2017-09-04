require 'spec_helper'

describe 'DatosEgresado' do
  before {
    @attributes = { # Atributos válidos
                   fk_numControl: 11161075,
                   fecha_actualizacion: "2017-04-04",
                   edo_civil_egresado: "Soltero",
                   dominio_idioma_egresado: 70,
                   estado_egresado: "Oaxaca",
                   calle_egresado: "Oriente 9",
                   colonia_egresado: "B. A.",
                   no_interior_egresado: 109,
                   no_exterior_egresado: 0,
                   telefono_egresado: 9511234567,
                   email_egresado: "egresado@gmail.com"}
  }
    
    context 'model' do
      it 'exist' do
        datos = DatosEgresado.new
        expect(datos).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        datos = DatosEgresado.new @attributes
        expect(datos).to be_valid
      end

      it 'is valid if belongs to :estudiante' do
	asociacion = DatosEgresado.reflect_on_association(:estudiante)
	expect(asociacion.macro).to be(:belongs_to)
      end
      
      it 'is valid if has many :empleos' do
	asociacion = DatosEgresado.reflect_on_association(:empleos)
	expect(asociacion.macro).to be(:has_many)
      end
      
      it 'is valid if has many :estudios' do
	asociacion = DatosEgresado.reflect_on_association(:estudios)
	expect(asociacion.macro).to be(:has_many)
      end
      
      describe '#fk_numControl' do
        context 'with invalid data' do
          it 'refuses numControl (en blanco)' do
            @attributes.merge!(fk_numControl: '')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses numControl (con menos de 8 caracteres)' do
            @attributes.merge!(fk_numControl: '1116107')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses numControl (con más de 9 caracteres)' do
            @attributes.merge!(fk_numControl: '1116107512')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses numControl (con caracter inválido)' do
            @attributes.merge!(fk_numControl: '1116107a')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
        end # invalid numControl
      end # numControl description
      
      # -------------------------------------------------------------
      
      describe '#fecha_actualizacion' do
        context 'with invalid data' do
          it 'refuses f_inicial (en blanco)' do
            skip ("usar fecha de rails")
            @attributes.merge!(fecha_actualizacion: '')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
        end # invalid fecha
      end # fecha description
      
      # -------------------------------------------------------------
      
      describe '#edo_civil_egresado' do
        it 'with invalid data refuses edo_civil (con más de 30 caracteres)' do
          @attributes.merge!(edo_civil_egresado: '.' * 31)
          datos = DatosEgresado.new @attributes
          expect(datos).to be_invalid
        end
      end # edo_civil description
      
      # -------------------------------------------------------------
      
      describe '#dominio_idioma_egresado' do
        context 'with invalid data' do
          it 'refuses dominio_idioma (con caracter inválido)' do
            @attributes.merge!(dominio_idioma_egresado: '10a')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses dominio_idioma (mayor a 100)' do
            @attributes.merge!(dominio_idioma_egresado: 101)
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
        end # invalid dominio_idioma
      end # dominio_idioma description
      
      # -------------------------------------------------------------
      
      describe '#estado_egresado' do
        it 'with invalid data, refuses estado_egresado (con más de 35 caracteres)' do
          @attributes.merge!(estado_egresado: '.' * 36)
          datos = DatosEgresado.new @attributes
          expect(datos).to be_invalid
        end
      end # estado_egresado description
      
      # -------------------------------------------------------------
      
      describe '#calle_egresado' do
        it 'with invalid data, refuses calle_egresado (con más de 35 caracteres)' do
          @attributes.merge!(calle_egresado: '.' * 36)
          datos = DatosEgresado.new @attributes
          expect(datos).to be_invalid
        end
      end # calle_egresado description
      
      # -------------------------------------------------------------
      
      describe '#colonia_egresado' do
        it 'with invalid data, refuses colonia_egresado (con más de 35 caracteres)' do
          @attributes.merge!(colonia_egresado: '.' * 36)
          datos = DatosEgresado.new @attributes
          expect(datos).to be_invalid
        end
      end # invalid colonia_egresado
      
      # -------------------------------------------------------------
      
      describe '#no_interior_egresado' do
        context 'with invalid data' do
          it 'refuses no_interior (con caracter inválido)' do
            @attributes.merge!(no_interior_egresado: '10a')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
        end # invalid no_interior
      end
      
      # -------------------------------------------------------------
      
      describe '#no_exterior_egresado' do
        context 'with invalid data' do
          it 'refuses no_exterior (con caracter inválido)' do
            @attributes.merge!(no_exterior_egresado: '10a')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
        end # invalid no_exterior
      end
      
      # -------------------------------------------------------------
      
      describe '#telefono_egresado' do
        context 'with invalid data' do
          it 'refuses telefono (con caracter inválido)' do
            @attributes.merge!(telefono_egresado: '951103705a')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses telefono (con más de 10 caracteres)' do
            @attributes.merge!(telefono_egresado: '95110370511')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
        end # invalid telefono
      end # telefono description
      
      # -------------------------------------------------------------
      
      describe '#email_egresado' do
        context 'with invalid data' do
          it 'refuses email (con caracter inválido en el usuario)' do
            @attributes.merge!(email_egresado: 'âdonnet@hotmail.com')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (sin usuario)' do
            @attributes.merge!(email_egresado: '@hotmail.com')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (sin @)' do
            @attributes.merge!(email_egresado: 'dnnthotmail.com')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (con más de un @)' do
            @attributes.merge!(email_egresado: 'dnnt@gma@il.com')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (con caracter inválido en el servidor)' do
            @attributes.merge!(email_egresado: 'dnnt@gmail~.com')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (sin dominio [tipo])' do
            @attributes.merge!(email_egresado: 'dont@hotmailcom')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (con punto y sin dominio [tipo])' do
            @attributes.merge!(email_egresado: 'dnnt@hotmail.')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (con caracter inválido en el dominio [tipo])' do
            @attributes.merge!(email_egresado: 'dnnt@outlook.c^om')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (con punto y sin dominio [regional])' do
            @attributes.merge!(email_egresado: 'dnnt@gmail.com.')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (con caracter inválido en el dominio [regional])' do
            @attributes.merge!(email_egresado: 'dnnt@outlook.com.m^x')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
          
          it 'refuses email (con punto después del dominio [regional])' do
            @attributes.merge!(email_egresado: 'dnnt@gmail.com.mx.')
            datos = DatosEgresado.new @attributes
            expect(datos).to be_invalid
          end
        end # invalid email
      end # email description
    end
  end
  
  
