require 'spec_helper'

describe 'ServicioEvaluacionCriterio' do
  context 'model' do
    it '' do
      skip("Pendiente")
    end
    
    it 'is valid if belongs to :servicio_evaluacion' do
      relacion = ServicioEvaluacionCriterio.reflect_on_association(:servicio_evaluacion)
      expect(relacion.macro).to be(:belongs_to)
    end

    it 'is valid if belongs to :cat_servicio_evaluacion_criterio' do
      relacion = ServicioEvaluacionCriterio.reflect_on_association(:cat_servicio_evaluacion_criterio)
      expect(relacion.macro).to be(:belongs_to)
    end
  end
end
