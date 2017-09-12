require 'rails_helper'

RSpec.describe "empleos/edit", type: :view do
  before(:each) do
    @empleo = assign(:empleo, Empleo.create!(
      fk_rfc_emp_inst: "AAAA111111AAA",
      fk_numControl: 11161075,
      f_inicial_empleo: "2017-03-27",
      f_final_empleo: "2017-03-30",
      nivel_jerarquico: "Jefe",
      condicion_trabajo: "Contrato",
      relacion_area_formacion: "100"
    ))
  end

  it "renders the edit empleo form" do
    render

    assert_select "form[action=?][method=?]", empleo_path(@empleo), "post" do

      assert_select "input#empleo_fk_rfc_emp_inst[name=?]", "empleo[fk_rfc_emp_inst]"

      assert_select "input#empleo_fk_numControl[name=?]", "empleo[fk_numControl]"

      assert_select "input#empleo_nivel_jerarquico[name=?]", "empleo[nivel_jerarquico]"

      assert_select "input#empleo_condicion_trabajo[name=?]", "empleo[condicion_trabajo]"

      assert_select "input#empleo_relacion_area_formacion[name=?]", "empleo[relacion_area_formacion]"
    end
  end
end
