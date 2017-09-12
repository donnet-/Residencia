require 'rails_helper'

RSpec.describe "cat_idiomas/new", type: :view do
  before(:each) do
    assign(:cat_idioma, CatIdioma.new(
      :nom_idioma => "MyString"
    ))
  end

  it "renders new cat_idioma form" do
    render

    assert_select "form[action=?][method=?]", cat_idiomas_path, "post" do

      assert_select "input#cat_idioma_nom_idioma[name=?]", "cat_idioma[nom_idioma]"
    end
  end
end
