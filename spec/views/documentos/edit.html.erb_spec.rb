require 'rails_helper'

RSpec.describe "documentos/edit", type: :view do
  before(:each) do
    @documento = assign(:documento, Documento.create!(
      :fk_id_cat_documento => 1,
      :pdf_documento => "MyString"
    ))
  end

  it "renders the edit documento form" do
    render

    assert_select "form[action=?][method=?]", documento_path(@documento), "post" do

      assert_select "input#documento_fk_id_cat_documento[name=?]", "documento[fk_id_cat_documento]"

      assert_select "input#documento_pdf_documento[name=?]", "documento[pdf_documento]"
    end
  end
end
