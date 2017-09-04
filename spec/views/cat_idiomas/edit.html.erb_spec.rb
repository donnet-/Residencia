require 'rails_helper'

RSpec.describe "cat_idiomas/edit", type: :view do
  before(:each) do
    @cat_idioma = assign(:cat_idioma, CatIdioma.create!(
      :nom_idioma => "Idioma"
    ))
  end

  it "renders the edit cat_idioma form" do
    render

    assert_select "form[action=?][method=?]", cat_idioma_path(@cat_idioma), "post" do

      assert_select "input#cat_idioma_nom_idioma[name=?]", "cat_idioma[nom_idioma]"
    end
  end
end
