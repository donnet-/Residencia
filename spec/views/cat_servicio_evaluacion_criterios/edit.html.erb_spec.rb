require 'rails_helper'

RSpec.describe "cat_servicio_evaluacion_criterios/edit", type: :view do
  before(:each) do
    @cat_servicio_evaluacion_criterio = assign(:cat_servicio_evaluacion_criterio, CatServicioEvaluacionCriterio.create!(
      :nombre_criterio_s => "MyString"
    ))
  end

  it "renders the edit cat_servicio_evaluacion_criterio form" do
    render

    assert_select "form[action=?][method=?]", cat_servicio_evaluacion_criterio_path(@cat_servicio_evaluacion_criterio), "post" do

      assert_select "input#cat_servicio_evaluacion_criterio_nombre_criterio_s[name=?]", "cat_servicio_evaluacion_criterio[nombre_criterio_s]"
    end
  end
end
