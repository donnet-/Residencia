require 'rails_helper'

RSpec.describe "cat_servicio_evaluacion_criterios/index", type: :view do
  before(:each) do
    assign(:cat_servicio_evaluacion_criterios, [
      CatServicioEvaluacionCriterio.create!(
        :nombre_criterio_s => "Nombre Criterio S"
      ),
      CatServicioEvaluacionCriterio.create!(
        :nombre_criterio_s => "Nombre Criterio S"
      )
    ])
  end

  it "renders a list of cat_servicio_evaluacion_criterios" do
    render
    assert_select "tr>td", :text => "Nombre Criterio S".to_s, :count => 2
  end
end
