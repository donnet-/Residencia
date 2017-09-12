require 'rails_helper'

RSpec.describe "anteproyectos/index", type: :view do
  before(:each) do
    assign(:anteproyectos, [
      Anteproyecto.create!(
        fk_id_proyecto_b: "1",
        fk_numControl: "11161075",
        nombre_anteproy: "SIDCITO",
        asesor_externo: "Jorge Agustín Zárate Pérez",
        status_anteproy: "Aprobado"
      ),
      Anteproyecto.create!(
        fk_id_proyecto_b: "1",
        fk_numControl: "11161075",
        nombre_anteproy: "SIDCITO",
        asesor_externo: "Jorge Agustín Zárate Pérez",
        status_anteproy: "Aprobado"
      )
    ])
  end

  it "renders a list of anteproyectos" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 11161075.to_s, :count => 2
    assert_select "tr>td", :text => "SIDCITO".to_s, :count => 2
    assert_select "tr>td", :text => "Jorge Agustín Zárate Pérez".to_s, :count => 2
    assert_select "tr>td", :text => "Aprobado".to_s, :count => 2
  end
end
