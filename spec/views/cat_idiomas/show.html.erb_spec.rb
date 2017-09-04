require 'rails_helper'

RSpec.describe "cat_idiomas/show", type: :view do
  before(:each) do
    @cat_idioma = assign(:cat_idioma, CatIdioma.create!(
      :nom_idioma => "Nom Idioma"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom Idioma/)
  end
end
