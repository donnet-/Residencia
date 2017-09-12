require 'rails_helper'

RSpec.describe "cat_satisfaccion_empleo_criterios/new", type: :view do
  before(:each) do
    assign(:cat_satisfaccion_empleo_criterio, CatSatisfaccionEmpleoCriterio.new(
      :nombre_criterio_e => "MyString"
    ))
  end

  it "renders new cat_satisfaccion_empleo_criterio form" do
    render

    assert_select "form[action=?][method=?]", cat_satisfaccion_empleo_criterios_path, "post" do

      assert_select "input#cat_satisfaccion_empleo_criterio_nombre_criterio_e[name=?]", "cat_satisfaccion_empleo_criterio[nombre_criterio_e]"
    end
  end
end
