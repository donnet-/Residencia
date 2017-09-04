require 'rails_helper'

RSpec.describe "cat_idiomas/index", type: :view do
  before(:each) do
    assign(:cat_idiomas, [
      CatIdioma.create!(
        :nom_idioma => "Nom Idioma"
      ),
      CatIdioma.create!(
        :nom_idioma => "Nom Idioma"
      )
    ])
  end

  it "renders a list of cat_idiomas" do
    render
    assert_select "tr>td", :text => "Nom Idioma".to_s, :count => 2
  end
end
