require 'rails_helper'

RSpec.describe "cat_tipo_proyectos/index", type: :view do
  before(:each) do
    assign(:cat_tipo_proyectos, [
      CatTipoProyecto.create!(
        :nombre => "Nombre"
      ),
      CatTipoProyecto.create!(
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of cat_tipo_proyectos" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
