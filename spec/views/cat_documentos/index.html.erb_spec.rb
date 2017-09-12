require 'rails_helper'

RSpec.describe "cat_documentos/index", type: :view do
  before(:each) do
    assign(:cat_documentos, [
      CatDocumento.create!(
        :nom_documento => "Documento"
      ),
      CatDocumento.create!(
        :nom_documento => "Documento"
      )
    ])
  end

  it "renders a list of cat_documentos" do
    render
    assert_select "tr>td", :text => "Documento".to_s, :count => 2
  end
end
