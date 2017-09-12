require 'rails_helper'

RSpec.describe "cat_satisfaccion_empleo_criterios/edit", type: :view do
  before(:each) do
    @cat_satisfaccion_empleo_criterio = assign(:cat_satisfaccion_empleo_criterio, CatSatisfaccionEmpleoCriterio.create!(
      :nombre_criterio_e => "MyString"
    ))
  end

  it "renders the edit cat_satisfaccion_empleo_criterio form" do
    render

    assert_select "form[action=?][method=?]", cat_satisfaccion_empleo_criterio_path(@cat_satisfaccion_empleo_criterio), "post" do

      assert_select "input#cat_satisfaccion_empleo_criterio_nombre_criterio_e[name=?]", "cat_satisfaccion_empleo_criterio[nombre_criterio_e]"
    end
  end
end
