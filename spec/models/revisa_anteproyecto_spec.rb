require 'spec_helper'

describe 'RevisaAnteproyecto' do
  context 'model' do
    it '' do
      skip("Pendiente")
    end

    it 'is valid if belongs to :anteproyecto' do
      asociacion = RevisaAnteproyecto.reflect_on_association(:anteproyecto)
      expect(asociacion.macro).to be(:belongs_to)
    end

    it 'is valid if belongs to :doncente' do
      asociacion = RevisaAnteproyecto.reflect_on_association(:docente)
      expect(asociacion.macro).to be(:belongs_to)
    end
  end
end
