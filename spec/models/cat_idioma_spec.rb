require 'spec_helper'

describe 'CatIdioma' do
  before {
    @attributes = { # Atributos válidos
                   nom_idioma: "inglés"
                  }
  }
    
    context 'model' do
      it 'exist' do
        idioma = CatIdioma.new
        expect(idioma).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        idioma = CatIdioma.new @attributes
        expect(idioma).to be_valid
      end
     
      it 'is valid if has one :extranjero_idioma' do
	relacion = CatIdioma.reflect_on_association(:extranjero_idioma)
	expect(relacion.macro).to be(:has_one)
      end
       
      describe '#nom_idioma' do
        context 'with invalid data' do
          it 'refuses nom_idioma (en blanco)' do
            @attributes.merge!(nom_idioma: '')
            idioma = CatIdioma.new @attributes
            expect(idioma).to be_invalid
          end
          
          it 'refuses nom_idioma (con más de 15 caracteres)' do
            @attributes.merge!(nom_idioma: '.' * 16)
            idioma = CatIdioma.new @attributes
            expect(idioma).to be_invalid
          end
        end
      end
    end
end
