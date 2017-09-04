require 'rails_helper'

RSpec.describe "empleos/index", type: :view do
  before(:each) do
    assign(:empleos, [
      Empleo.create!(
        fk_rfc_emp_inst: "AAAA111111AAA",
        fk_numControl: 11161075,
        f_inicial_empleo: "2017-03-27",
        f_final_empleo: "2017-03-30",
        nivel_jerarquico: "Jefe",
        condicion_trabajo: "Contrato",
        relacion_area_formacion: "100"
      ),
      Empleo.create!(
        fk_rfc_emp_inst: "AAAA111111AAA",
        fk_numControl: 11161075,
        f_inicial_empleo: "2017-03-27",
        f_final_empleo: "2017-03-30",
        nivel_jerarquico: "Jefe",
        condicion_trabajo: "Contrato",
        relacion_area_formacion: "100"
      )
    ])
  end

  it "renders a list of empleos" do
    render
    assert_select "tr>td", :text => "AAAA111111AAA".to_s, :count => 2
    assert_select "tr>td", :text => 11161075.to_s, :count => 2
    assert_select "tr>td", :text => "2017-03-27".to_s, :count => 2
    assert_select "tr>td", :text => "2017-03-30".to_s, :count => 2
    assert_select "tr>td", :text => "Jefe".to_s, :count => 2
    assert_select "tr>td", :text => "Contrato".to_s, :count => 2
    assert_select "tr>td", :text => "100".to_s, :count => 2
  end
end
