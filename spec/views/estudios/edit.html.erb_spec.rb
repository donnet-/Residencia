require 'rails_helper'

RSpec.describe "estudios/edit", type: :view do
  before(:each) do
    @estudio = assign(:estudio, Estudio.create!(
      fk_numControl: 11161075,
      instituto_estudio: "ITO",
      estudio: "Estudio",
      grado_estudio: 2,
      especialidad_estudio: "Especialidad",
      f_inicial_estudio: Date.tomorrow,
      f_final_estudio: 180.days.from_now
    ))
  end

  it "renders the edit estudio form" do
    render

    assert_select "form[action=?][method=?]", estudio_path(@estudio), "post" do

      assert_select "input#estudio_fk_numControl[name=?]", "estudio[fk_numControl]"

      assert_select "textarea#estudio_instituto_estudio[name=?]", "estudio[instituto_estudio]"

      assert_select "textarea#estudio_estudio[name=?]", "estudio[estudio]"

      assert_select "input#estudio_grado_estudio[name=?]", "estudio[grado_estudio]"

      assert_select "textarea#estudio_especialidad_estudio[name=?]", "estudio[especialidad_estudio]"
    end
  end
end
