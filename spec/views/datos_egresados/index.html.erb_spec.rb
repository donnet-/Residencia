require 'rails_helper'

RSpec.describe "datos_egresados/index", type: :view do
  before(:each) do
    assign(:datos_egresados, [
      DatosEgresado.create!(
        fk_numControl: 11161075,
        fecha_actualizacion: "2017-04-04",
        edo_civil_egresado: "Soltero",
        dominio_idioma_egresado: 70,
        estado_egresado: "Oaxaca",
        calle_egresado: "Oriente 9",
        colonia_egresado: "B. A.",
        no_interior_egresado: 109,
        no_exterior_egresado: 0,
        telefono_egresado: 9511234567,
        email_egresado: "egresado@gmail.com"
      ),
      DatosEgresado.create!(
        fk_numControl: 11161075,
        fecha_actualizacion: "2017-04-04",
        edo_civil_egresado: "Soltero",
        dominio_idioma_egresado: 70,
        estado_egresado: "Oaxaca",
        calle_egresado: "Oriente 9",
        colonia_egresado: "B. A.",
        no_interior_egresado: 109,
        no_exterior_egresado: 0,
        telefono_egresado: 9511234567,
        email_egresado: "egresado@gmail.com"
      )
    ])
  end

  it "renders a list of datos_egresados" do
    render
    assert_select "tr>td", :text => 11161075.to_s, :count => 2
    assert_select "tr>td", :text => "2017-04-04".to_s, :count => 2
    assert_select "tr>td", :text => "Soltero".to_s, :count => 2
    assert_select "tr>td", :text => 70.to_s, :count => 2
    assert_select "tr>td", :text => "Oaxaca".to_s, :count => 2
    assert_select "tr>td", :text => "Oriente 9".to_s, :count => 2
    assert_select "tr>td", :text => "B. A.".to_s, :count => 2
    assert_select "tr>td", :text => 109.to_s, :count => 2
    assert_select "tr>td", :text => 0.to_s, :count => 2
    assert_select "tr>td", :text => 9511234567.to_s, :count => 2
    assert_select "tr>td", :text => "egresado@gmail.com".to_s, :count => 2
  end
end
