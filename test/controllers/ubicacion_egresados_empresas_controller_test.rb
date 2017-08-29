require 'test_helper'

class UbicacionEgresadosEmpresasControllerTest < ActionController::TestCase
  setup do
    @ubicacion_egresados_empresa = ubicacion_egresados_empresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ubicacion_egresados_empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ubicacion_egresados_empresa" do
    assert_difference('UbicacionEgresadosEmpresa.count') do
      post :create, ubicacion_egresados_empresa: { cant_mando_intermedio: @ubicacion_egresados_empresa.cant_mando_intermedio, cant_mando_superior: @ubicacion_egresados_empresa.cant_mando_superior, cant_mando_tecnico: @ubicacion_egresados_empresa.cant_mando_tecnico, carreras_demandan: @ubicacion_egresados_empresa.carreras_demandan, completamente: @ubicacion_egresados_empresa.completamente, ligeramente: @ubicacion_egresados_empresa.ligeramente, medianamente: @ubicacion_egresados_empresa.medianamente, ninguna_relacion: @ubicacion_egresados_empresa.ninguna_relacion, num_prof: @ubicacion_egresados_empresa.num_prof, otro_can: @ubicacion_egresados_empresa.otro_can, otro_esp: @ubicacion_egresados_empresa.otro_esp, requisitos: @ubicacion_egresados_empresa.requisitos }
    end

    assert_redirected_to ubicacion_egresados_empresa_path(assigns(:ubicacion_egresados_empresa))
  end

  test "should show ubicacion_egresados_empresa" do
    get :show, id: @ubicacion_egresados_empresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ubicacion_egresados_empresa
    assert_response :success
  end

  test "should update ubicacion_egresados_empresa" do
    patch :update, id: @ubicacion_egresados_empresa, ubicacion_egresados_empresa: { cant_mando_intermedio: @ubicacion_egresados_empresa.cant_mando_intermedio, cant_mando_superior: @ubicacion_egresados_empresa.cant_mando_superior, cant_mando_tecnico: @ubicacion_egresados_empresa.cant_mando_tecnico, carreras_demandan: @ubicacion_egresados_empresa.carreras_demandan, completamente: @ubicacion_egresados_empresa.completamente, ligeramente: @ubicacion_egresados_empresa.ligeramente, medianamente: @ubicacion_egresados_empresa.medianamente, ninguna_relacion: @ubicacion_egresados_empresa.ninguna_relacion, num_prof: @ubicacion_egresados_empresa.num_prof, otro_can: @ubicacion_egresados_empresa.otro_can, otro_esp: @ubicacion_egresados_empresa.otro_esp, requisitos: @ubicacion_egresados_empresa.requisitos }
    assert_redirected_to ubicacion_egresados_empresa_path(assigns(:ubicacion_egresados_empresa))
  end

  test "should destroy ubicacion_egresados_empresa" do
    assert_difference('UbicacionEgresadosEmpresa.count', -1) do
      delete :destroy, id: @ubicacion_egresados_empresa
    end

    assert_redirected_to ubicacion_egresados_empresas_path
  end
end
