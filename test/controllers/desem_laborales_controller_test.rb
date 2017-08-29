require 'test_helper'

class DesemLaboralesControllerTest < ActionController::TestCase
  setup do
    @desem_laboral = desem_laborales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desem_laborales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desem_laboral" do
    assert_difference('DesemLaboral.count') do
      post :create, desem_laboral: { area_estudio: @desem_laboral.area_estudio, calificacion_academica: @desem_laboral.calificacion_academica, conocimiento_idioma: @desem_laboral.conocimiento_idioma, eficincia: @desem_laboral.eficincia, experiencia_laboral: @desem_laboral.experiencia_laboral, otros: @desem_laboral.otros, personalidad_actitud: @desem_laboral.personalidad_actitud, posicionamiento: @desem_laboral.posicionamiento, recomendaciones: @desem_laboral.recomendaciones, titulacion: @desem_laboral.titulacion, utilidad_residencia: @desem_laboral.utilidad_residencia }
    end

    assert_redirected_to desem_laboral_path(assigns(:desem_laboral))
  end

  test "should show desem_laboral" do
    get :show, id: @desem_laboral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @desem_laboral
    assert_response :success
  end

  test "should update desem_laboral" do
    patch :update, id: @desem_laboral, desem_laboral: { area_estudio: @desem_laboral.area_estudio, calificacion_academica: @desem_laboral.calificacion_academica, conocimiento_idioma: @desem_laboral.conocimiento_idioma, eficincia: @desem_laboral.eficincia, experiencia_laboral: @desem_laboral.experiencia_laboral, otros: @desem_laboral.otros, personalidad_actitud: @desem_laboral.personalidad_actitud, posicionamiento: @desem_laboral.posicionamiento, recomendaciones: @desem_laboral.recomendaciones, titulacion: @desem_laboral.titulacion, utilidad_residencia: @desem_laboral.utilidad_residencia }
    assert_redirected_to desem_laboral_path(assigns(:desem_laboral))
  end

  test "should destroy desem_laboral" do
    assert_difference('DesemLaboral.count', -1) do
      delete :destroy, id: @desem_laboral
    end

    assert_redirected_to desem_laborales_path
  end
end
