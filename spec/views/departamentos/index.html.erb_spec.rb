require 'rails_helper'

RSpec.describe "departamentos/index", type: :view do
  before(:each) do
    assign(:departamentos, [
      Departamento.create!(
        :name => "Name",
        :contenido => "Contenido"
      ),
      Departamento.create!(
        :name => "Name",
        :contenido => "Contenido"
      )
    ])
  end

  it "renders a list of departamentos" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contenido".to_s, :count => 2
  end
end
