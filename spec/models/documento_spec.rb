require 'spec_helper'

describe 'Documento' do
  before {
    @attributes = { # Atributos válidos
                   fk_id_cat_documento: 123,
                   pdf_documento: "localización"
                   }
  }
    
    context 'model' do
      it 'exist' do
        doc = Documento.new
        expect(doc).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        doc = Documento.new @attributes
        expect(doc).to be_valid
      end
      
      # -------------------------------------------------------------
      
      describe '#fk_id_cat_documento' do
        context 'with invalid data' do
          it 'refuses id_cat_documento (en blanco)' do
            @attributes.merge!(fk_id_cat_documento: '')
            doc = Documento.new @attributes
            expect(doc).to be_invalid
          end
          
          it 'refuses id_cat_documento (con caracter inválido)' do
            @attributes.merge!(fk_id_cat_documento: '12a')
            doc = Documento.new @attributes
            expect(doc).to be_invalid
          end
        end # invalid id_cat_documento
      end # id_cat_documento description
      
      # -------------------------------------------------------------
     
      describe '#pdf_documento' do
        context 'with invalid data' do
          it 'refuses pdf_documento (en blanco)' do
            @attributes.merge!(pdf_documento: '')
            doc = Documento.new @attributes
            expect(doc).to be_invalid
          end
          
          it 'refuses pdf_documento (con más de 255 caracteres)' do
            @attributes.merge!(pdf_documento: '.' * 256)
            doc = Documento.new @attributes
            expect(doc).to be_invalid
          end
        end # invalid pdf_documento
      end # pdf_documento description
    end
end
