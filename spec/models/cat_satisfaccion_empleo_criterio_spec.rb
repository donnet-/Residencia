require 'spec_helper'

describe 'CatSatisfaccionEmpleoCriterio' do
  before {
    @attributes = { # Atributos válidos
                   nombre_criterio_e: "Puntualidad"}
  }
    
    context 'model' do
      it 'exist' do
        criterio = CatSatisfaccionEmpleoCriterio.new
        expect(criterio).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        criterio = CatSatisfaccionEmpleoCriterio.new @attributes
        expect(criterio).to be_valid
      end

      it 'is valid if has one :satisfaccion_empleo_criterio' do
	relacion = CatSatisfaccionEmpleoCriterio.reflect_on_association(:satisfaccion_empleo_criterio)
	expect(relacion.macro).to be(:has_one)
      end
      
      describe '#nombre_criterio_e' do
        context 'with invalid data' do
          it 'refuses nombre_criterio_e (en blanco)' do
            @attributes.merge!(nombre_criterio_e: '')
            criterio = CatSatisfaccionEmpleoCriterio.new @attributes
            expect(criterio).to be_invalid
          end
          
          it 'refuses nombre_criterio_e (con más de 50 caracteres)' do
            @attributes.merge!(nombre_criterio_e: '.' * 51)
            criterio = CatSatisfaccionEmpleoCriterio.new @attributes
            expect(criterio).to be_invalid
          end
        end
      end
    end
end
