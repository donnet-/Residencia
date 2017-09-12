require 'rails_helper'

RSpec.describe "datos_egresados/show", type: :view do
  before(:each) do
    @datos_egresado = assign(:datos_egresado, DatosEgresado.create!(
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/11161075/)
    expect(rendered).to match(/2017-04-04/)
    expect(rendered).to match(/Soltero/)
    expect(rendered).to match(/70/)
    expect(rendered).to match(/Oaxaca/)
    expect(rendered).to match(/Oriente 9/)
    expect(rendered).to match(/B. A./)
    expect(rendered).to match(/109/)
    expect(rendered).to match(/0/)
    expect(rendered).to match(/9511234567/)
    expect(rendered).to match(/egresado@gmail.com/)
  end
end
