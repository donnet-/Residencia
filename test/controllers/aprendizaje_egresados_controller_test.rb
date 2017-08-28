require 'test_helper'

class AprendizajeEgresadosControllerTest < ActionController::TestCase
  setup do
    @aprendizaje_egresado = aprendizaje_egresados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aprendizaje_egresados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aprendizaje_egresado" do
    assert_difference('AprendizajeEgresado.count') do
      post :create, aprendizaje_egresado: { calidad_docente: @aprendizaje_egresado.calidad_docente, condiciones_estudio: @aprendizaje_egresado.condiciones_estudio, experiencia: @aprendizaje_egresado.experiencia, plan_estudio: @aprendizaje_egresado.plan_estudio, proyecto_investigacion: @aprendizaje_egresado.proyecto_investigacion }
    end

    assert_redirected_to aprendizaje_egresado_path(assigns(:aprendizaje_egresado))
  end

  test "should show aprendizaje_egresado" do
    get :show, id: @aprendizaje_egresado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aprendizaje_egresado
    assert_response :success
  end

  test "should update aprendizaje_egresado" do
    patch :update, id: @aprendizaje_egresado, aprendizaje_egresado: { calidad_docente: @aprendizaje_egresado.calidad_docente, condiciones_estudio: @aprendizaje_egresado.condiciones_estudio, experiencia: @aprendizaje_egresado.experiencia, plan_estudio: @aprendizaje_egresado.plan_estudio, proyecto_investigacion: @aprendizaje_egresado.proyecto_investigacion }
    assert_redirected_to aprendizaje_egresado_path(assigns(:aprendizaje_egresado))
  end

  test "should destroy aprendizaje_egresado" do
    assert_difference('AprendizajeEgresado.count', -1) do
      delete :destroy, id: @aprendizaje_egresado
    end

    assert_redirected_to aprendizaje_egresados_path
  end
end
