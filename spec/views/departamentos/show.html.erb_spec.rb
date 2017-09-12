require 'rails_helper'

RSpec.describe "departamentos/show", type: :view do
  before(:each) do
    @departamento = assign(:departamento, Departamento.create!(
      :name => "Name",
      :contenido => "Contenido"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contenido/)
  end
end
