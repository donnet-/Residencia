require 'rails_helper'

RSpec.describe "anteproyectos/edit", type: :view do
  before(:each) do
    @anteproyecto = assign(:anteproyecto, Anteproyecto.create!(
      fk_id_proyecto_b: "1",
      fk_numControl: "11161075",
      nombre_anteproy: "SIDCITO",
      asesor_externo: "Jorge Agustín Zárate Pérez",
      status_anteproy: "Aprobado"
    ))
  end

  it "renders the edit anteproyecto form" do
    render

    assert_select "form[action=?][method=?]", anteproyecto_path(@anteproyecto), "post" do

      assert_select "input#anteproyecto_fk_id_proyecto_b[name=?]", "anteproyecto[fk_id_proyecto_b]"

      assert_select "input#anteproyecto_fk_numControl[name=?]", "anteproyecto[fk_numControl]"

      assert_select "input#anteproyecto_nombre_anteproy[name=?]", "anteproyecto[nombre_anteproy]"

      assert_select "input#anteproyecto_asesor_externo[name=?]", "anteproyecto[asesor_externo]"

      assert_select "input#anteproyecto_status_anteproy[name=?]", "anteproyecto[status_anteproy]"
    end
  end
end
