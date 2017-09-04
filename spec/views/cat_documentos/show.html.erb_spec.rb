require 'rails_helper'

RSpec.describe "cat_documentos/show", type: :view do
  before(:each) do
    @cat_documento = assign(:cat_documento, CatDocumento.create!(
      :nom_documento => "Nombre Documento"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre Documento/)
  end
end
