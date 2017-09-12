require 'rails_helper'

RSpec.describe "solicitudes/index", type: :view do
  before(:each) do
    assign(:solicitudes, [
      Solicitud.create!(
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
      ),
      Solicitud.create!(
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
      )
    ])
  end

  it "renders a list of solicitudes" do
    render
    assert_select "tr>td", :text => "Nombrep".to_s, :count => 2
    assert_select "tr>td", :text => "Aexterno".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
    assert_select "tr>td", :text => "Correo".to_s, :count => 2
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Carrera".to_s, :count => 2
    assert_select "tr>td", :text => "Semestre".to_s, :count => 2
    assert_select "tr>td", :text => "Ingles".to_s, :count => 2
    assert_select "tr>td", :text => "Horario".to_s, :count => 2
    assert_select "tr>td", :text => "Desproyecto".to_s, :count => 2
    assert_select "tr>td", :text => "Objetivo".to_s, :count => 2
    assert_select "tr>td", :text => "Actividades".to_s, :count => 2
    assert_select "tr>td", :text => "Pc".to_s, :count => 2
    assert_select "tr>td", :text => "Tel Escritorio".to_s, :count => 2
    assert_select "tr>td", :text => "Lugar".to_s, :count => 2
    assert_select "tr>td", :text => "Beca".to_s, :count => 2
    assert_select "tr>td", :text => "Observacion".to_s, :count => 2
  end
end
