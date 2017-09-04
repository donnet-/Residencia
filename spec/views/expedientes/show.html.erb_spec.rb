require 'rails_helper'

RSpec.describe "expedientes/show", type: :view do
  before(:each) do
    @expediente = assign(:expediente, Expediente.create!(
      :periodo_expediente => "Periodo Expediente",
      :fk_id_documento => 2,
      :fk_numProyecto => "Fk Num Proyecto"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Periodo Expediente/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Fk Num Proyecto/)
  end
end
