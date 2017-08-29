require 'test_helper'

class DatosGeneralesEmpresasControllerTest < ActionController::TestCase
  setup do
    @datos_generales_empresa = datos_generales_empresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datos_generales_empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datos_generales_empresa" do
    assert_difference('DatosGeneralesEmpresa.count') do
      post :create, datos_generales_empresa: { actividad_economica: @datos_generales_empresa.actividad_economica, calle: @datos_generales_empresa.calle, ciudad: @datos_generales_empresa.ciudad, colonia: @datos_generales_empresa.colonia, correo: @datos_generales_empresa.correo, cp: @datos_generales_empresa.cp, estado: @datos_generales_empresa.estado, municipio: @datos_generales_empresa.municipio, nombre_empresa: @datos_generales_empresa.nombre_empresa, numero: @datos_generales_empresa.numero, tam_empresa: @datos_generales_empresa.tam_empresa, telefono: @datos_generales_empresa.telefono, tipo_empresa: @datos_generales_empresa.tipo_empresa }
    end

    assert_redirected_to datos_generales_empresa_path(assigns(:datos_generales_empresa))
  end

  test "should show datos_generales_empresa" do
    get :show, id: @datos_generales_empresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @datos_generales_empresa
    assert_response :success
  end

  test "should update datos_generales_empresa" do
    patch :update, id: @datos_generales_empresa, datos_generales_empresa: { actividad_economica: @datos_generales_empresa.actividad_economica, calle: @datos_generales_empresa.calle, ciudad: @datos_generales_empresa.ciudad, colonia: @datos_generales_empresa.colonia, correo: @datos_generales_empresa.correo, cp: @datos_generales_empresa.cp, estado: @datos_generales_empresa.estado, municipio: @datos_generales_empresa.municipio, nombre_empresa: @datos_generales_empresa.nombre_empresa, numero: @datos_generales_empresa.numero, tam_empresa: @datos_generales_empresa.tam_empresa, telefono: @datos_generales_empresa.telefono, tipo_empresa: @datos_generales_empresa.tipo_empresa }
    assert_redirected_to datos_generales_empresa_path(assigns(:datos_generales_empresa))
  end

  test "should destroy datos_generales_empresa" do
    assert_difference('DatosGeneralesEmpresa.count', -1) do
      delete :destroy, id: @datos_generales_empresa
    end

    assert_redirected_to datos_generales_empresas_path
  end
end
