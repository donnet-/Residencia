require 'rails_helper'

RSpec.describe "documentos/new", type: :view do
  before(:each) do
    assign(:documento, Documento.new(
      :fk_id_cat_documento => 1,
      :pdf_documento => "MyString"
    ))
  end

  it "renders new documento form" do
    render

    assert_select "form[action=?][method=?]", documentos_path, "post" do

      assert_select "input#documento_fk_id_cat_documento[name=?]", "documento[fk_id_cat_documento]"

      assert_select "input#documento_pdf_documento[name=?]", "documento[pdf_documento]"
    end
  end
end
