require 'rails_helper'

RSpec.describe "cat_servicio_evaluacion_criterios/new", type: :view do
  before(:each) do
    assign(:cat_servicio_evaluacion_criterio, CatServicioEvaluacionCriterio.new(
      :nombre_criterio_s => "MyString"
    ))
  end

  it "renders new cat_servicio_evaluacion_criterio form" do
    render

    assert_select "form[action=?][method=?]", cat_servicio_evaluacion_criterios_path, "post" do

      assert_select "input#cat_servicio_evaluacion_criterio_nombre_criterio_s[name=?]", "cat_servicio_evaluacion_criterio[nombre_criterio_s]"
    end
  end
end
