require 'rails_helper'

RSpec.describe "cat_tipo_proyectos/edit", type: :view do
  before(:each) do
    @cat_tipo_proyecto = assign(:cat_tipo_proyecto, CatTipoProyecto.create!(
      :nombre => "MyString"
    ))
  end

  it "renders the edit cat_tipo_proyecto form" do
    render

    assert_select "form[action=?][method=?]", cat_tipo_proyecto_path(@cat_tipo_proyecto), "post" do

      assert_select "input#cat_tipo_proyecto_nombre[name=?]", "cat_tipo_proyecto[nombre]"
    end
  end
end
