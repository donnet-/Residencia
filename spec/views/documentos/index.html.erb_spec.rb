require 'rails_helper'

RSpec.describe "documentos/index", type: :view do
  before(:each) do
    assign(:documentos, [
      Documento.create!(
        :fk_id_cat_documento => 2,
        :pdf_documento => "Pdf Documento"
      ),
      Documento.create!(
        :fk_id_cat_documento => 2,
        :pdf_documento => "Pdf Documento"
      )
    ])
  end

  it "renders a list of documentos" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Pdf Documento".to_s, :count => 2
  end
end
