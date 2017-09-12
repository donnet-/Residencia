require 'rails_helper'

RSpec.describe "expedientes/index", type: :view do
  before(:each) do
    assign(:expedientes, [
      Expediente.create!(
        :periodo_expediente => "Periodo Expediente",
        :fk_id_documento => 2,
        :fk_numProyecto => "Fk Num Proyecto"
      ),
      Expediente.create!(
        :periodo_expediente => "Periodo Expediente",
        :fk_id_documento => 2,
        :fk_numProyecto => "Fk Num Proyecto"
      )
    ])
  end

  it "renders a list of expedientes" do
    render
    assert_select "tr>td", :text => "Periodo Expediente".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Fk Num Proyecto".to_s, :count => 2
  end
end
