require 'test_helper'

class PerfilEgresadosControllerTest < ActionController::TestCase
  setup do
    @perfil_egresado = perfil_egresados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perfil_egresados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perfil_egresado" do
    assert_difference('PerfilEgresado.count') do
      post :create, perfil_egresado: { curp: @perfil_egresado.curp, direccion: @perfil_egresado.direccion, dominio_ingles: @perfil_egresado.dominio_ingles, edo_civil: @perfil_egresado.edo_civil, egresado_especialidad: @perfil_egresado.egresado_especialidad, email: @perfil_egresado.email, fecha_egresado: @perfil_egresado.fecha_egresado, fecha_nac: @perfil_egresado.fecha_nac, fk_numControl: @perfil_egresado.fk_numControl, idioma_otro: @perfil_egresado.idioma_otro, m_software: @perfil_egresado.m_software, nombre: @perfil_egresado.nombre, sexo: @perfil_egresado.sexo, telefon: @perfil_egresado.telefon, titulo: @perfil_egresado.titulo }
    end

    assert_redirected_to perfil_egresado_path(assigns(:perfil_egresado))
  end

  test "should show perfil_egresado" do
    get :show, id: @perfil_egresado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @perfil_egresado
    assert_response :success
  end

  test "should update perfil_egresado" do
    patch :update, id: @perfil_egresado, perfil_egresado: { curp: @perfil_egresado.curp, direccion: @perfil_egresado.direccion, dominio_ingles: @perfil_egresado.dominio_ingles, edo_civil: @perfil_egresado.edo_civil, egresado_especialidad: @perfil_egresado.egresado_especialidad, email: @perfil_egresado.email, fecha_egresado: @perfil_egresado.fecha_egresado, fecha_nac: @perfil_egresado.fecha_nac, fk_numControl: @perfil_egresado.fk_numControl, idioma_otro: @perfil_egresado.idioma_otro, m_software: @perfil_egresado.m_software, nombre: @perfil_egresado.nombre, sexo: @perfil_egresado.sexo, telefon: @perfil_egresado.telefon, titulo: @perfil_egresado.titulo }
    assert_redirected_to perfil_egresado_path(assigns(:perfil_egresado))
  end

  test "should destroy perfil_egresado" do
    assert_difference('PerfilEgresado.count', -1) do
      delete :destroy, id: @perfil_egresado
    end

    assert_redirected_to perfil_egresados_path
  end
end
