require 'spec_helper'

describe 'ServicioEvaluacion' do
  context 'model' do
    it '' do
      skip("Pendiente")
    end

    it 'is valid if belongs to :servicio_social' do
      relacion = ServicioEvaluacion.reflect_on_association(:servicio_social)
      expect(relacion.macro).to be(:belongs_to)
    end
    
    it 'is valid if has many :servicio_evaluacion_criterios' do
      relacion = ServicioEvaluacion.reflect_on_association(:servicio_evaluacion_criterios)
      expect(relacion.macro).to be(:has_many)
    end
  end
end
