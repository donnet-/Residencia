require 'spec_helper'

describe 'CatTipoProyecto' do
  before {
    @attributes = { # Atributos válidos
                   nombre: 'Investigación'}
  }
    
    context 'model' do
      it 'exist' do
        tipo = CatTipoProyecto.new
        expect(tipo).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        tipo = CatTipoProyecto.new @attributes
        expect(tipo).to be_valid
      end
     
      it 'is valid if has one :proyecto' do
	asociacion = CatTipoProyecto.reflect_on_association(:proyecto)
	expect(asociacion.macro).to be(:has_one)
      end

      describe '#nombre' do
        context 'with invalid data' do
          it 'refuses nombre (en blanco)' do
            @attributes.merge!(nombre: '')
            tipo = CatTipoProyecto.new @attributes
            expect(tipo).to be_invalid
          end
          
          it 'refuses nombre (con más de 30 caracteres)' do
            @attributes.merge!(nombre: '.' * 31)
            tipo = CatTipoProyecto.new @attributes
            expect(tipo).to be_invalid
          end
        end
      end
    end
end
