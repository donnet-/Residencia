require 'rails_helper'

RSpec.describe "expedientes/edit", type: :view do
  before(:each) do
    @expediente = assign(:expediente, Expediente.create!(
      :periodo_expediente => "MyString",
      :fk_id_documento => 1,
      :fk_numProyecto => "MyString"
    ))
  end

  it "renders the edit expediente form" do
    render

    assert_select "form[action=?][method=?]", expediente_path(@expediente), "post" do

      assert_select "input#expediente_periodo_expediente[name=?]", "expediente[periodo_expediente]"

      assert_select "input#expediente_fk_id_documento[name=?]", "expediente[fk_id_documento]"

      assert_select "input#expediente_fk_numProyecto[name=?]", "expediente[fk_numProyecto]"
    end
  end
end
