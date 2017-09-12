
require 'spec_helper'

describe 'CatDocumento' do
  before { 
    @attributes = { # Atributos válidos
                   nom_documento: "solucitud"
                   }
  }
    
    context 'model' do
      it 'exist' do
        doc = CatDocumento.new
        expect(doc).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        doc = CatDocumento.new @attributes
        expect(doc).to be_valid
      end
      
      it 'is valid if belongs to :documento' do
        asociacion = CatDocumento.reflect_on_association(:documento)
        expect(asociacion.macro).to be(:belongs_to)
      end
      
      describe '#nom_documento' do
        context 'with invalid data' do
          it 'refuses nom_documento (en blanco)' do
            @attributes.merge!(nom_documento: '')
            doc = CatDocumento.new @attributes
            expect(doc).to be_invalid
          end
          
          it 'refuses nom_documento (con más de 255 caracteres)' do
            @attributes.merge!(nom_documento: '.' * 256)
            doc = CatDocumento.new @attributes
            expect(doc).to be_invalid
          end
        end
      end
    end
  end
  
