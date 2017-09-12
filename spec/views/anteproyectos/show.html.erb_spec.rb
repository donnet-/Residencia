require 'rails_helper'

RSpec.describe "anteproyectos/show", type: :view do
  before(:each) do
    @anteproyecto = assign(:anteproyecto, Anteproyecto.create!(
      :fk_id_proyecto_b => 2,
      :fk_numControl => 11161075,
      :nombre_anteproy => "Nombre Anteproy",
      :asesor_externo => "Asesor Externo",
      :status_anteproy => "Status Anteproy"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/11161075/)
    expect(rendered).to match(/Nombre Anteproy/)
    expect(rendered).to match(/Asesor Externo/)
    expect(rendered).to match(/Status Anteproy/)
  end
end
