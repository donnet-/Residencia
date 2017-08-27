require 'test_helper'

class DocentesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "Insertar" do
  	docente = Docente.new
  	assert_not docente.save
  end
  test "Docente uno" do 
  	docente = Docente.new({nombreD: "Mayte", apPaterno: "Mejia", apMaterno: "Palacios", curp: "MEPM940116MOCJLY00",
  						   genero: "F", email: "maytemejia@live.com.mx", cat_departamento_id: 1, tipoDocente: "BASE", estado: "activo", rfc: "MEPM940116QE4"})
  	assert docente.save
  end
end
