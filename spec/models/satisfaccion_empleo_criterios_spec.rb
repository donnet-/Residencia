require 'spec_helper'

describe 'SatisfaccionEmpleoCriterio' do
  context 'model' do
    it '' do
      skip("Pendiente")
    end
    
    it 'is valid if belongs to :empleo' do
      relacion = SatisfaccionEmpleoCriterio.reflect_on_association(:empleo)
      expect(relacion.macro).to be(:belongs_to)
    end

    it 'is valid if belongs to :cat_satisfaccion_empleo_criterios' do
      relacion = SatisfaccionEmpleoCriterio.reflect_on_association(:cat_satisfaccion_empleo_criterios)
      expect(relacion.macro).to be(:belongs_to)
    end
  end
end
