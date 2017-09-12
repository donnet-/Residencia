require 'rails_helper'

RSpec.describe "banco_proyectos/edit", type: :view do
  before(:each) do
    @banco_proyecto = assign(:banco_proyecto, BancoProyecto.create!(
      fk_rfc_emp_inst: 'AAAA111111AAA',
      nombre_proyecto_b: 'SIDSCITO',
      descrip_proyecto_b: 'Descripción',
      tipo_proyecto_b: 'Tipo',
      fecha_inicio_proyecto_b: Date.tomorrow,
      fecha_termino_proyecto_b: 10.days.from_now,
      num_residentes: 2,
      objetivo_esperado: 'Objetivo',
      pdf_solicitud: 'ruta/solicitud.pdf'
    ))
  end

  it "renders the edit banco_proyecto form" do
    render

    assert_select "form[action=?][method=?]", banco_proyecto_path(@banco_proyecto), "post" do

      assert_select "input#banco_proyecto_fk_rfc_emp_inst[name=?]", "banco_proyecto[fk_rfc_emp_inst]"

      assert_select "input#banco_proyecto_nombre_proyecto_b[name=?]", "banco_proyecto[nombre_proyecto_b]"

      assert_select "textarea#banco_proyecto_descrip_proyecto_b[name=?]", "banco_proyecto[descrip_proyecto_b]"

      assert_select "input#banco_proyecto_tipo_proyecto_b[name=?]", "banco_proyecto[tipo_proyecto_b]"

      assert_select "input#banco_proyecto_tipo_proyecto_b[name=?]", "banco_proyecto[tipo_proyecto_b]"

      assert_select "input#banco_proyecto_num_residentes[name=?]", "banco_proyecto[num_residentes]"

      assert_select "textarea#banco_proyecto_objetivo_esperado[name=?]", "banco_proyecto[objetivo_esperado]"

      assert_select "input#banco_proyecto_pdf_solicitud[name=?]", "banco_proyecto[pdf_solicitud]"
    end
  end
end
