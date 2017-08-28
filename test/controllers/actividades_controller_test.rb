require 'test_helper'

class ActividadesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "primera actividad" do 
  	actividad = Actividad.new({nombreActividad: "Tutoria 2017", tipoComision: "Tutoria", tipoEvidencia: "Individual",
  								cat_tipo_actividad_id: 1, fechaInicio: "2017/04/03", fechaTermino: "2017/04/04", descripcion: "T2017"})
  	assert actividad.save
  end
  test "segunda actividad" do 
  	actividad = Actividad.new({nombreActividad: "Tutorias verano", tipoComision: "Tutoria", tipoEvidencia: "Individual",
  								cat_tipo_actividad_id: 1, fechaInicio: "2017/04/03", fechaTermino: "2017/04/04", descripcion: "T2017"})
  	assert actividad.save
  end
  test "fecha anterior" do 
  	actividad = Actividad.new({nombreActividad: "Tutorias 2017", tipoComision: "Tutoria", tipoEvidencia: "Individual",
  								cat_tipo_actividad_id: 1, fechaInicio: "2017/04/10", fechaTermino: "2017/04/04", descripcion: "T2017"})
  	assert_not actividad.save
  end
end
