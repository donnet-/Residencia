require 'rails_helper'

RSpec.describe "estudios/index", type: :view do
  before(:each) do
    assign(:estudios, [
      Estudio.create!(
        fk_numControl: 11161075,
        instituto_estudio: "ITO",
        estudio: "Estudio",
        grado_estudio: 2,
        especialidad_estudio: "Especialidad",
        f_inicial_estudio: "2017-07-01",
        f_final_estudio: "2017-08-02"
      ),
      Estudio.create!(
        fk_numControl: 11161075,
        instituto_estudio: "ITO",
        estudio: "Estudio",
        grado_estudio: 2,
        especialidad_estudio: "Especialidad",
        f_inicial_estudio: "2017-07-01",
        f_final_estudio: "2017-08-02"
      )
    ])
  end

  it "renders a list of estudios" do
    render
    assert_select "tr>td", :text => 11161075.to_s, :count => 2
    assert_select "tr>td", :text => "ITO".to_s, :count => 2
    assert_select "tr>td", :text => "Estudio".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Especialidad".to_s, :count => 2
    assert_select "tr>td", :text => "2017-07-01".to_s, :count => 2
    assert_select "tr>td", :text => "2017-08-02".to_s, :count => 2
  end
end
