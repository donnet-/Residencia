require 'rails_helper'

RSpec.describe "banco_proyectos/show", type: :view do
  before(:each) do
    @banco_proyecto = assign(:banco_proyecto, BancoProyecto.create!(
      fk_rfc_emp_inst: 'AAAA111111AAA',
      nombre_proyecto_b: 'SIDSCITO',
      descrip_proyecto_b: 'Descripción',
      tipo_proyecto_b: 'Tipo',
      fecha_inicio_proyecto_b: '2017-07-01',
      fecha_termino_proyecto_b: '2017-08-20',
      num_residentes: 2,
      objetivo_esperado: 'Objetivo',
      pdf_solicitud: 'rutasolicitud.pdf'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/AAAA111111AAA/)
    expect(rendered).to match(/SIDSCITO/)
    expect(rendered).to match(/Descripción/)
    expect(rendered).to match(/Tipo/)
    expect(rendered).to match(/2017-07-01/)
    expect(rendered).to match(/2017-08-20/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Objetivo/)
    expect(rendered).to match(/rutasolicitud.pdf/)
  end
end
