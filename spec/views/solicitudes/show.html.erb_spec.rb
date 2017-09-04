require 'rails_helper'

RSpec.describe "solicitudes/show", type: :view do
  before(:each) do
    @solicitud = assign(:solicitud, Solicitud.create!(
      :nombrep => "Nombrep",
      :aexterno => "Aexterno",
      :telefono => "Telefono",
      :correo => "Correo",
      :area => "Area",
      :numresidentes => 2,
      :carrera => "Carrera",
      :semestre => "Semestre",
      :ingles => "Ingles",
      :horario => "Horario",
      :desproyecto => "Desproyecto",
      :objetivo => "Objetivo",
      :actividades => "Actividades",
      :pc => "Pc",
      :tel_escritorio => "Tel Escritorio",
      :lugar => "Lugar",
      :beca => "Beca",
      :observacion => "Observacion"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombrep/)
    expect(rendered).to match(/Aexterno/)
    expect(rendered).to match(/Telefono/)
    expect(rendered).to match(/Correo/)
    expect(rendered).to match(/Area/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Carrera/)
    expect(rendered).to match(/Semestre/)
    expect(rendered).to match(/Ingles/)
    expect(rendered).to match(/Horario/)
    expect(rendered).to match(/Desproyecto/)
    expect(rendered).to match(/Objetivo/)
    expect(rendered).to match(/Actividades/)
    expect(rendered).to match(/Pc/)
    expect(rendered).to match(/Tel Escritorio/)
    expect(rendered).to match(/Lugar/)
    expect(rendered).to match(/Beca/)
    expect(rendered).to match(/Observacion/)
  end
end
