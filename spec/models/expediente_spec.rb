require 'spec_helper'

describe 'Expediente' do
  context 'model' do
    it '' do
      skip("Pendiente")
    end

    it 'is valid if belongs to :proyecto' do
      asociacion = Expediente.reflect_on_association(:proyecto)
      expect(asociacion.macro).to be(:belongs_to)
    end

    it 'is valid if has_many :documentos' do
      asociacion = Expediente.reflect_on_association(:documentos)
      expect(asociacion.macro).to be(:has_many)
    end
  end
end
