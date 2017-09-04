require 'rails_helper'

RSpec.describe "anteproyectos/new", type: :view do
  before(:each) do
    assign(:anteproyecto, Anteproyecto.new(
      :fk_id_proyecto_b => 1,
      :fk_numControl => 1,
      :nombre_anteproy => "MyString",
      :asesor_externo => "MyString",
      :status_anteproy => "MyString"
    ))
  end

  it "renders new anteproyecto form" do
    render

    assert_select "form[action=?][method=?]", anteproyectos_path, "post" do

      assert_select "input#anteproyecto_fk_id_proyecto_b[name=?]", "anteproyecto[fk_id_proyecto_b]"

      assert_select "input#anteproyecto_fk_numControl[name=?]", "anteproyecto[fk_numControl]"

      assert_select "input#anteproyecto_nombre_anteproy[name=?]", "anteproyecto[nombre_anteproy]"

      assert_select "input#anteproyecto_asesor_externo[name=?]", "anteproyecto[asesor_externo]"

      assert_select "input#anteproyecto_status_anteproy[name=?]", "anteproyecto[status_anteproy]"
    end
  end
end
