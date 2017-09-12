require 'rails_helper'

RSpec.describe "empleos/show", type: :view do
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/AAAA111111AAA/)
    expect(rendered).to match(/11161075/)
    expect(rendered).to match(/2017-03-27/)
    expect(rendered).to match(/2017-03-30/)
    expect(rendered).to match(/Jefe/)
    expect(rendered).to match(/Contrato/)
    expect(rendered).to match(/100/)
  end
end
