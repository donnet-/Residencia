require 'spec_helper'

describe 'CatServicioEvaluacionCriterio ' do
  before {
    @attributes = { # Atributos válidos
                   nombre_criterio_s: "Responsable"}
  }
    
    context 'model' do
      it 'exist' do
        criterio = CatServicioEvaluacionCriterio.new
        expect(criterio).to_not be_nil
      end
      
      it 'is valid with all the attributes' do
        criterio = CatServicioEvaluacionCriterio.new @attributes
        expect(criterio).to be_valid
      end
      
      it 'is valid if has one :servicio_evaluacion_criterio' do
	asociacion = CatServicioEvaluacionCriterio.reflect_on_association(:servicio_evaluacion_criterio)
	expect(asociacion.macro).to be(:has_one)
      end

      describe '#nombre_criterio_s' do
        context 'with invalid data' do
          it 'refuses nombre_criterio_s (en blanco)' do
            @attributes.merge!(nombre_criterio_s: '')
            criterio = CatServicioEvaluacionCriterio.new @attributes
            expect(criterio).to be_invalid
          end
          
          it 'refuses nombre_criterio_s (con más de 50 caracteres)' do
            @attributes.merge!(nombre_criterio_s: '.' * 51)
            criterio = CatServicioEvaluacionCriterio.new @attributes
            expect(criterio).to be_invalid
          end
        end
      end
    end
end
