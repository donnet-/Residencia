require 'rails_helper'

RSpec.describe "cat_tipo_proyectos/show", type: :view do
  before(:each) do
    @cat_tipo_proyecto = assign(:cat_tipo_proyecto, CatTipoProyecto.create!(
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
  end
end
