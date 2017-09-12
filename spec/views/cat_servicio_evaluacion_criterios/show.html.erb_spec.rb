require 'rails_helper'

RSpec.describe "cat_servicio_evaluacion_criterios/show", type: :view do
  before(:each) do
    @cat_servicio_evaluacion_criterio = assign(:cat_servicio_evaluacion_criterio, CatServicioEvaluacionCriterio.create!(
      :nombre_criterio_s => "Nombre Criterio S"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre Criterio S/)
  end
end
