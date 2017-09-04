require 'rails_helper'

RSpec.describe "cat_satisfaccion_empleo_criterios/index", type: :view do
  before(:each) do
    assign(:cat_satisfaccion_empleo_criterios, [
      CatSatisfaccionEmpleoCriterio.create!(
        :nombre_criterio_e => "Nombre Criterio E"
      ),
      CatSatisfaccionEmpleoCriterio.create!(
        :nombre_criterio_e => "Nombre Criterio E"
      )
    ])
  end

  it "renders a list of cat_satisfaccion_empleo_criterios" do
    render
    assert_select "tr>td", :text => "Nombre Criterio E".to_s, :count => 2
  end
end
