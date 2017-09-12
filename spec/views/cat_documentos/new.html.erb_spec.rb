require 'rails_helper'

RSpec.describe "cat_documentos/new", type: :view do
  before(:each) do
    assign(:cat_documento, CatDocumento.new(
      :nom_documento => "Solicitud"
    ))
  end

  it "renders new cat_documento form" do
    render

    assert_select "form[action=?][method=?]", cat_documentos_path, "post" do

      assert_select "input#cat_documento_nom_documento[name=?]", "cat_documento[nom_documento]"
    end
  end
end
