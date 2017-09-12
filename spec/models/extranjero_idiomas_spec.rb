require 'spec_helper'

describe 'ExtranjeroIdioma' do
  context 'model' do
    it '' do
      skip("Pendiente")
    end

    it 'is valid if belongs to :empleo' do
      relacion = ExtranjeroIdioma.reflect_on_association(:empleo)
      expect(relacion.macro).to be(:belongs_to)
    end
    
    it 'is valid if belongs_to :cat_idioma' do
      relacion = ExtranjeroIdioma.reflect_on_association(:cat_idioma)
      expect(relacion.macro).to be(:belongs_to)
    end
  end
end
