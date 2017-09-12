require 'rails_helper'

RSpec.describe "cat_documentos/edit", type: :view do
  before(:each) do
    @cat_documento = assign(:cat_documento, CatDocumento.create!(
      :nom_documento => "Documento"
    ))
  end

  it "renders the edit cat_documento form" do
    render

    assert_select "form[action=?][method=?]", cat_documento_path(@cat_documento), "post" do

      assert_select "input#cat_documento_nom_documento[name=?]", "cat_documento[nom_documento]"
    end
  end
end
