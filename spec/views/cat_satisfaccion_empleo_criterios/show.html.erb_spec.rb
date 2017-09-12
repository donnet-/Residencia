require 'rails_helper'

RSpec.describe "cat_satisfaccion_empleo_criterios/show", type: :view do
  before(:each) do
    @cat_satisfaccion_empleo_criterio = assign(:cat_satisfaccion_empleo_criterio, CatSatisfaccionEmpleoCriterio.create!(
      :nombre_criterio_e => "Nombre Criterio E"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre Criterio E/)
  end
end
