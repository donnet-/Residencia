require 'rails_helper'

RSpec.describe "banco_proyectos/index", type: :view do
  before(:each) do
    assign(:banco_proyectos, [
      BancoProyecto.create!(
        fk_rfc_emp_inst: 'AAAA111111AAA',
        nombre_proyecto_b: 'SIDSCITO',
        descrip_proyecto_b: 'Descripción',
        tipo_proyecto_b: 'Tipo',
        fecha_inicio_proyecto_b: '2017-07-01',
        fecha_termino_proyecto_b: '2017-08-01',
        num_residentes: 2,
        objetivo_esperado: 'Objetivo',
        pdf_solicitud: 'ruta/solicitud.pdf'
      ),
      BancoProyecto.create!(
        fk_rfc_emp_inst: 'AAAA111111AAA',
        nombre_proyecto_b: 'SIDSCITO',
        descrip_proyecto_b: 'Descripción',
        tipo_proyecto_b: 'Tipo',
        fecha_inicio_proyecto_b: '2017-07-01',
        fecha_termino_proyecto_b: '2017-08-01',
        num_residentes: '2',
        objetivo_esperado: 'Objetivo',
        pdf_solicitud: 'ruta/solicitud.pdf'
      )
    ])
  end

  it "renders a list of banco_proyectos" do
    render
    assert_select "tr>td", :text => "AAAA111111AAA".to_s, :count => 2
    assert_select "tr>td", :text => "SIDSCITO".to_s, :count => 2
    assert_select "tr>td", :text => "Descripción".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo".to_s, :count => 2
    assert_select "tr>td", :text => "2017-07-01".to_s, :count => 2
    assert_select "tr>td", :text => "2017-08-01".to_s, :count => 2
    assert_select "tr>td", :text => "2".to_s, :count => 2
    assert_select "tr>td", :text => "Objetivo".to_s, :count => 2
    assert_select "tr>td", :text => "ruta/solicitud.pdf".to_s, :count => 2
  end
end
