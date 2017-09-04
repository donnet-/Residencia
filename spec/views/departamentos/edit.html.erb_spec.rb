require 'rails_helper'

RSpec.describe "departamentos/edit", type: :view do
  before(:each) do
    @departamento = assign(:departamento, Departamento.create!(
      :nombre => "MyString",
      :fecha => "2017-07-01"
      :contenido => "MyString"
    ))
  end

  it "renders the edit departamento form" do
    render

    assert_select "form[action=?][method=?]", departamento_path(@departamento), "post" do

      assert_select "input#departamento_nombre[nombre=?]", "departamento[nombre]"

      assert_select "input#departamento_fecha[fecha=?]", "departamento[fecha]"

      assert_select "input#departamento_contenido[name=?]", "departamento[contenido]"
    end
  end
end
