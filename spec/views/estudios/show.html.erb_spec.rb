require 'rails_helper'

RSpec.describe "estudios/show", type: :view do
  before(:each) do
    @estudio = assign(:estudio, Estudio.create!(
      fk_numControl: 11161075,
      instituto_estudio: "ITO",
      estudio: "Estudio",
      grado_estudio: 2,
      especialidad_estudio: "Especialidad",
      f_inicial_estudio: "2017-07-01",
      f_final_estudio: "2017-08-02"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/11161075/)
    expect(rendered).to match(/ITO/)
    expect(rendered).to match(/Estudio/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Especialidad/)
    expect(rendered).to match(/2017-07-01/)
    expect(rendered).to match(/2017-08-02/)
  end
end
