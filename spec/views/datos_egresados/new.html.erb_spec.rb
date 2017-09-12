require 'rails_helper'

RSpec.describe "datos_egresados/new", type: :view do
  before(:each) do
    assign(:datos_egresado, DatosEgresado.new(
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
    ))
  end

  it "renders new datos_egresado form" do
    render

    assert_select "form[action=?][method=?]", datos_egresados_path, "post" do

      assert_select "input#datos_egresado_fk_numControl[name=?]", "datos_egresado[fk_numControl]"

      assert_select "textarea#datos_egresado_edo_civil_egresado[name=?]", "datos_egresado[edo_civil_egresado]"

      assert_select "input#datos_egresado_dominio_idioma_egresado[name=?]", "datos_egresado[dominio_idioma_egresado]"

      assert_select "textarea#datos_egresado_estado_egresado[name=?]", "datos_egresado[estado_egresado]"

      assert_select "textarea#datos_egresado_calle_egresado[name=?]", "datos_egresado[calle_egresado]"

      assert_select "textarea#datos_egresado_colonia_egresado[name=?]", "datos_egresado[colonia_egresado]"

      assert_select "input#datos_egresado_no_interior_egresado[name=?]", "datos_egresado[no_interior_egresado]"

      assert_select "input#datos_egresado_no_exterior_egresado[name=?]", "datos_egresado[no_exterior_egresado]"

      assert_select "input#datos_egresado_telefono_egresado[name=?]", "datos_egresado[telefono_egresado]"

      assert_select "textarea#datos_egresado_email_egresado[name=?]", "datos_egresado[email_egresado]"
    end
  end
end
