require 'rails_helper'

RSpec.describe "documentos/show", type: :view do
  before(:each) do
    @documento = assign(:documento, Documento.create!(
      :fk_id_cat_documento => 2,
      :pdf_documento => "Pdf Documento"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Pdf Documento/)
  end
end
