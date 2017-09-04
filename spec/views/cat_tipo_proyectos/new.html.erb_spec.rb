require 'rails_helper'

RSpec.describe "cat_tipo_proyectos/new", type: :view do
  before(:each) do
    assign(:cat_tipo_proyecto, CatTipoProyecto.new(
      :nombre => "MyString"
    ))
  end

  it "renders new cat_tipo_proyecto form" do
    render

    assert_select "form[action=?][method=?]", cat_tipo_proyectos_path, "post" do

      assert_select "input#cat_tipo_proyecto_nombre[name=?]", "cat_tipo_proyecto[nombre]"
    end
  end
end
