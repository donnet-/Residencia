require 'rails_helper'

RSpec.describe "solicitudes/new", type: :view do
  before(:each) do
    assign(:solicitud, Solicitud.new(
      :nombrep => "MyString",
      :aexterno => "MyString",
      :telefono => "MyString",
      :correo => "MyString",
      :area => "MyString",
      :numresidentes => 1,
      :carrera => "MyString",
      :semestre => "MyString",
      :ingles => "MyString",
      :horario => "MyString",
      :desproyecto => "MyString",
      :objetivo => "MyString",
      :actividades => "MyString",
      :pc => "MyString",
      :tel_escritorio => "MyString",
      :lugar => "MyString",
      :beca => "MyString",
      :observacion => "MyString"
    ))
  end

  it "renders new solicitud form" do
    render

    assert_select "form[action=?][method=?]", solicitudes_path, "post" do

      assert_select "input#solicitud_nombrep[name=?]", "solicitud[nombrep]"

      assert_select "input#solicitud_aexterno[name=?]", "solicitud[aexterno]"

      assert_select "input#solicitud_telefono[name=?]", "solicitud[telefono]"

      assert_select "input#solicitud_correo[name=?]", "solicitud[correo]"

      assert_select "input#solicitud_area[name=?]", "solicitud[area]"

      assert_select "input#solicitud_numresidentes[name=?]", "solicitud[numresidentes]"

      assert_select "input#solicitud_carrera[name=?]", "solicitud[carrera]"

      assert_select "input#solicitud_semestre[name=?]", "solicitud[semestre]"

      assert_select "input#solicitud_ingles[name=?]", "solicitud[ingles]"

      assert_select "input#solicitud_horario[name=?]", "solicitud[horario]"

      assert_select "input#solicitud_desproyecto[name=?]", "solicitud[desproyecto]"

      assert_select "input#solicitud_objetivo[name=?]", "solicitud[objetivo]"

      assert_select "input#solicitud_actividades[name=?]", "solicitud[actividades]"

      assert_select "input#solicitud_pc[name=?]", "solicitud[pc]"

      assert_select "input#solicitud_tel_escritorio[name=?]", "solicitud[tel_escritorio]"

      assert_select "input#solicitud_lugar[name=?]", "solicitud[lugar]"

      assert_select "input#solicitud_beca[name=?]", "solicitud[beca]"

      assert_select "input#solicitud_observacion[name=?]", "solicitud[observacion]"
    end
  end
end
